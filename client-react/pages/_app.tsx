import Head from 'next/head';

import '../styles/globals.css';
import Layout from '../components/layout/layout';

function MyApp() {
  return (
      <Layout>
        <Head>
          <meta name='viewport' content='width=device-width, initial-scale=1' />
        </Head>
      </Layout>
  );
}

export default MyApp;
