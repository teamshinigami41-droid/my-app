import reflex as rx

config = rx.Config(
    app_name="my_app",
    frontend_packages=["@react-router/dev@8.4.0"],
    plugins=[
        rx.plugins.SitemapPlugin(),
        rx.plugins.TailwindV4Plugin(),
    ],
)