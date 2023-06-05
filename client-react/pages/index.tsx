import { Fragment } from 'react';
import Head from 'next/head';

function HomePage() {
  return (
      <Fragment>
        <Head>
          <title>Faucet</title>
          <meta
              name='description'
              content='I post about programming and web development.'
          />
        </Head>
      </Fragment>
  );
}

export default HomePage;
