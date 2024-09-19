import streamlit as st
from connect_data_warehouse import query_job_listings
from wordcloud import WordCloud
import matplotlib.pyplot as plt
import pandas as pd

# Create some sample text


def layout():
    df = query_job_listings()

    st.title("Data job ads")
    st.write(
        "This dashboard shows data engineering, data analyst and data science job ads from arbetsförmedlingens API. "
    )

    
    st.markdown("## Vacancies")
    cols = st.columns(3)

    with cols[0]:
        st.metric(label="Total", value=df["VACANCIES"].sum())

    with cols[1]:
        st.metric(
            label="In Göteborg",
            value=df.query("WORKPLACE_CITY == 'Göteborg'")["VACANCIES"].sum(),
        )

    with cols[2]:
        st.metric(
            label="In Stockholm",
            value=df.query("WORKPLACE_CITY == 'Stockholm'")["VACANCIES"].sum(),
        )
    st.line_chart(query_job_listings(""" 
                    SELECT 
                        SUM(vacancies) as vacancies,
                        publication_date
                    FROM 
                        marts_job_listings
                    GROUP BY publication_date
                    """),
                    x="PUBLICATION_DATE",
                    y="VACANCIES"
                    )
    cols = st.columns(2)

    with cols[0]:
        st.markdown("### Per city")
        st.dataframe(
            query_job_listings(
                """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        workplace_city
                    FROM 
                        marts_job_listings
                    GROUP BY 
                        workplace_city
                    ORDER BY vacancies DESC;
                    """
            )
        )
    with cols[1]:
        st.markdown("### Per company (top 10)")
        st.bar_chart(
            query_job_listings(
                """
                    SELECT 
                        SUM(vacancies) as vacancies,
                        employer_name
                    FROM 
                        marts_job_listings
                    GROUP BY 
                        employer_name
                    ORDER BY vacancies DESC LIMIT 10;
                    """
            ),
            x="EMPLOYER_NAME",
            y="VACANCIES",
            horizontal=True,
            stack=True,
            height=460,
        )
    
    st.markdown("## Most indemand jobs")
    list = df['HEADLINE'].tolist()
    text=""
    for x in list:
        text += x+", "
    # Create and generate a word cloud image:
    font_path = 'C:/Windows/Fonts/Papyrus.ttf'
    wordcloud = WordCloud().generate(text)

    # Display the generated image:
    plt.imshow(wordcloud, interpolation='bilinear')
    fig, ax = plt.subplots(figsize = (12, 8))
    ax.imshow(wordcloud)
    plt.axis("off")
    fig.set_edgecolor("black")
    fig.set_linewidth(20)
    st.pyplot(fig)

    st.markdown("## Find advertisement")

    cols = st.columns(2)
    with cols[0]:
        selected_company = st.selectbox(
            "Select a company:", df["EMPLOYER_NAME"].unique()
        )

    with cols[1]:
        selected_headline = st.selectbox(
            "Select an advertisement:",
            df.query("EMPLOYER_NAME == @selected_company")["HEADLINE"],
        )
    cols = st.columns(2)
    with cols[0]:
        publication_date = df.query("HEADLINE == @selected_headline and EMPLOYER_NAME == @selected_company")["PUBLICATION_DATE"].values[0]
        application_deadline = df.query("HEADLINE == @selected_headline and EMPLOYER_NAME == @selected_company")["APPLICATION_DEADLINE"].values[0]
        publication_date = pd.to_datetime(str(publication_date)).strftime('%Y-%m-%d')
        application_deadline = pd.to_datetime(str(application_deadline)).strftime('%Y-%m-%d')
        st.metric(label="Publication Date", 
                  value=publication_date)
    
    with cols[1]:
        st.metric(label="Application Deadline", value=application_deadline)
    st.markdown("### Job ad")
    st.markdown(
        df.query(
            "HEADLINE == @selected_headline and EMPLOYER_NAME == @selected_company"
        )["DESCRIPTION_HTML_FORMATTED"].values[0],
        unsafe_allow_html=True,
    )

    st.markdown("## Job listings data")
    st.dataframe(df)
    


if __name__ == "__main__":
    layout()