Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF54939FEFE
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 20:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhFHS0p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 14:26:45 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:55922 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhFHS0o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 14:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1623176691; x=1654712691;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=SCGIC+kWolvRPADN2IZakdvO1O7gsdN9FgS/lIZz7E8=;
  b=JnVo0+/Y9WuJiETI7YIJ0NSid7gykRtQKBBprRjx9buBkEhS8sTs6LNF
   zNIDTqDPD9D0wqgQM/2jobg/+HpDTWV6yn7nNstHfQtPvNnN2mTIMfgpJ
   92gQRNm8V5rtdVdywzcec0gjbHuhjkyhU5lWvdwAlGnygKtuiWebEvv6Y
   OqpxV9WjM9gDiTXq/1hCr4Ezb/QgVIcVckMHYMnTrb7jh7Eod09doOS24
   ry3o6IpJZrZQGusynuWhkO6lIr9nYzs4/TmqyLaoNrITsDh7DJS0cCXlJ
   aDawXd7EEoR6eUArFs4DMOpQZBCYOAAt00ZDdUwlp3REz1BUwY0N2vSyD
   w==;
IronPort-SDR: v1JV5LizWRZGBl2sJR3HB2h/j6FrT35BFvpCMYIHkAdDJ7DxJJx1MpCPTZDrefQady178WoOU1
 e4t2FEmcw3elDmn6BBwCL/MAz/NggtiwN0twsWB6xbrXocuLXyPT73RRUE4hoTRJ67DG2f5wTL
 bhuXm15GobNxImLJFT5rjjG+zEZyE2KWnYVFPsv8By4507TzgwwhWR76ilSmNh9rMt3IrUl1eB
 eNO2u5xfjhgHVac12lqort/zA/HJBnseZYaqQfxJY9yR6zNYie3R6FGHCe3DctX3RCbHEhWCoT
 2hY=
X-IronPort-AV: E=Sophos;i="5.83,259,1616428800"; 
   d="scan'208";a="170470222"
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
  by ob1.hgst.iphmx.com with ESMTP; 09 Jun 2021 02:24:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3KBnd4xu/TH9WE3GR3MVXX7Uc0FQ2Pgx+Wnbxy4tpiR76z6o7ACrvh65aUvDCBnB+PP+UihA64hnrSRCe3TWyJ71LmtlzCAlm02tD6WG9rwdRwFWLsAKYdc4eSaCXmnIqCrICYox2edXiGEaljdKgwTzAWeV3nyH/EPLAMVOZ+U0R5gxksaATdGSdnd+1FN+TPJrI9DXcUv2cqqX37BxzMpy/woKhCtYZfevqqXG3n3dx2SbzRtCX6ZrN4iPt3dKT/LrUP4gOIIVFUJGxpnQz4PUUqpU21MiGh/spB6hthGKY5ZcRnE+7O818MqFZr2Sobx5RbRYRrQkNL08H+FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCGIC+kWolvRPADN2IZakdvO1O7gsdN9FgS/lIZz7E8=;
 b=YRLWeKUheEs8jaBHKKMjRvFWYdRZGH2rhS8Ii8ALBUhebdjMXqXUr87Drnqe7ZIwp7ky+rXf4PKrl9DYcITl7SCDdYvWN7aKt2UXEJ0eY3vPQC2JB2/FzrCIzKI4SHFdTjEaUY87V4n1+CdTY1a/JIQYke5B457QoHd1GI0EM4YXHA9SSkBClaXv0dbqctufVGxsquMVQgYVIROHEuQ3x5Rj5IkDwLeuCPN7pnQMoOGOxli7b9ABPPJSeEKx2ZS5E0GzVwST6XENb5Yqetc02EF35UfHCsQ7YV/uCIOofvvMAi7nl2VREzNJtTTCMdVVu/l6xwoCITnY1S3PmuFSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCGIC+kWolvRPADN2IZakdvO1O7gsdN9FgS/lIZz7E8=;
 b=mBRZOpopkSI6wPV6inUio+znZnAornuqrInZlrL4PW6a3t/e5ZKe0IJ5qt35nml1f0OhF9Q2S5BvF+tbhMVpKpKiDPtn7ct8wAWGVeGgVTdyZb2mex+ofFpy94CTy6zgphh3aMm1oPvcGlRpiW+vnONtpdD9wb9lSp/XpQ8rjH0=
Received: from DM6PR04MB4972.namprd04.prod.outlook.com (2603:10b6:5:fc::10) by
 DM5PR04MB0299.namprd04.prod.outlook.com (2603:10b6:3:70::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.23; Tue, 8 Jun 2021 18:24:47 +0000
Received: from DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f]) by DM6PR04MB4972.namprd04.prod.outlook.com
 ([fe80::8dc6:ecf:9d83:615f%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 18:24:47 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Jens Axboe <axboe@kernel.dk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>,
        "dm-devel@redhat.com" <dm-devel@redhat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Subject: Re: [PATCH 12/16] block: use memcpy_to_bvec in copy_to_high_bio_irq
Thread-Topic: [PATCH 12/16] block: use memcpy_to_bvec in copy_to_high_bio_irq
Thread-Index: AQHXXIB9t5FIM8uwxUadNIOUcakDaQ==
Date:   Tue, 8 Jun 2021 18:24:47 +0000
Message-ID: <DM6PR04MB497278CD0294B519C995A2DE86379@DM6PR04MB4972.namprd04.prod.outlook.com>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-13-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e10918a-570f-466f-48da-08d92aaab28b
x-ms-traffictypediagnostic: DM5PR04MB0299:
x-microsoft-antispam-prvs: <DM5PR04MB0299B0BDB367B89B488349A386379@DM5PR04MB0299.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvoO7hDVWlHWufXNdX6flaSi2IMFe1LgLIG15X2VwuETZ9JOzJySGmbpi6qM51yY3MDukChEcfjtxBSAyGOiAprQjWw6ANAUudpZNzyyji5L2QhNZppJxTgbDaX+LhPsxNgwyR4pDWCvsoWPEjJRUYAE9rcU/DgltYw8jaLZx5cnnhibOfK1Fc7yKlzs/F3zwtFIGz4Ipp+xkjx/J+bguumgf5uCV8E6XuNxomVY7wwLCgBL14V3duDv7iT+cr8hLyKTYRn7TFQyZvH+XangRqhOutye6YHRSrv6cjGgUZOTSmb4YllZLfVRujI+uPQUXAyUxZC5/a2rrkWAxpqKcyF3P+bhUXhdWu1PV1vW19sy3w2LSoBiijmuWJbetWf1eYn5Rx/uLxGHjGwmrsRU7XT7sznMutg7NAJHBSqizSF15q5a4aFeUAvgGnpcvxyGc5xWrf5f5VSxRJ3mQWSLs2M2TDQYfZe4vpg0YgvqmTqncxnKEe7RLVVSrcJqVmEcqVAhdKzR+pBcboA02FWSNuNx/UOd76T5zPQD+xPdiJ5GqTlI4t0HXdg/30jtnTBtqMYPvBgmy9kXyWR5mzyjmu76pilfoLvy1917DZjmaP4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB4972.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(9686003)(54906003)(55016002)(86362001)(558084003)(71200400001)(7696005)(2906002)(186003)(6916009)(52536014)(478600001)(33656002)(4326008)(66446008)(66476007)(53546011)(91956017)(76116006)(8936002)(66946007)(6506007)(26005)(8676002)(38100700002)(5660300002)(316002)(7416002)(122000001)(64756008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w06D9yw/kDDV2M1fKtQK8wYfGlK6THH1PyWf5eCUwlq9tTUlKFMZfshmt5++?=
 =?us-ascii?Q?E4Ju/utQpQlTy6rKNNsXJK3wWAEbSHze98PDXVwC4UrazOvTCCAUK8JLVU0Y?=
 =?us-ascii?Q?hV08VIeww+1Tkyrw+JB4qpG4lQqtVXKIHRikw3Krws2YRJpLG1BedHc0Tghi?=
 =?us-ascii?Q?2pdetK8uPAB1hgJkj8Jrmv1JEi2PJiN8bW9wmu9O8NBebgq1u7tFqatV6EAQ?=
 =?us-ascii?Q?DlZ3AMdHgk9/Yd+yinR/6qNTkeUBLElXdxG3sotGpBkV2aAlJxrSykB/VOpy?=
 =?us-ascii?Q?CioqhuWOgi32jbenywzGa9/pJJhYnj/zGOMlFBoSoD9px4C11SAaP2fM4YX/?=
 =?us-ascii?Q?mbABra28U5PYVCrQKUn9Hjce1PHxpUsc5v1iF/jEUcGsbOJs6wB0A9QlV/TZ?=
 =?us-ascii?Q?I30czyw3FWbzLm05cybUGDEUlB8JWtOsKZaGvX3kk5ck2G5ue/oFLKAoCqsf?=
 =?us-ascii?Q?AY4+hHJWRljA3yLcyqM1cvH3TmFdBZXzJxpaxl8nJ82G98VDrII1i5eB63F4?=
 =?us-ascii?Q?rDzCsMvALNNH+nynFQxnHVOWXZNc7B2bamGnfdeu7ux1ECr6EuDrboI/09i/?=
 =?us-ascii?Q?IAtXQonIefthnkl7qO8Ba/vrBD7zmrkyUrNn2RuUCBkhIQvtIDawPUGIlFQK?=
 =?us-ascii?Q?YMD4VLLVA3vfPHvbO5tLJzyZWCIvtilEqiC6RGYphCCfSalKrRWJXPUyznPa?=
 =?us-ascii?Q?3xqMQPjORyNeJuI95hg6GzZA6O8eSAHAi8CMccDhHp8zsLRa0FihYaZxpCX6?=
 =?us-ascii?Q?PkUMTc4K2WrB1IGlssuRxrUnAZsuCNuM820CBWuSEvOjBtIQNjSYrENCsLPs?=
 =?us-ascii?Q?dEQrCLiVhVdts15FewBo/5TM2fVctnJBiFkm+gZGKcDymVtXNFetSHSVai9O?=
 =?us-ascii?Q?oUcw5mQ9pXpy5ec7CnKEbPlLprePhlDrkASfzxosc7I7bLgMp2+LkvD+tu7B?=
 =?us-ascii?Q?yX6fLYaC/CWAE40ETMg48e5Ry4pelJyWdvM4S/+d/5ucFQ4evpVdlJQpkc9K?=
 =?us-ascii?Q?BIXMrImTnrz55wWcb5pPJQx40DIUdfN2OYgzQI2/svpEPSZOSTmIjVOWZsGH?=
 =?us-ascii?Q?/yiEVBxm7yzgemMWKbozEbp4trsS/ca/Rhh0cAtVyoA/8L42Dib2vwLoCyld?=
 =?us-ascii?Q?yxCuIIax+aLgqIBTmKvZVL0zX9bonCfguDfkL6mBlcRU6JcSoPFlXxU98ekJ?=
 =?us-ascii?Q?1CjKLVARLG3utNG1tg0uu/ahp3KYzEyh7MhxMbyfuKZlKfjkis7EImQo5N/N?=
 =?us-ascii?Q?6dc6n1wRGEeSVmmfwO1dAjqKjCwrBs4lQglPPw1b/EC/DaYHNclGEg0S1wM7?=
 =?us-ascii?Q?y7g9zyIRAOi+j2Xc2QX8MccF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB4972.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e10918a-570f-466f-48da-08d92aaab28b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 18:24:47.6356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHbSwkQn49DyXDiDK2ZUT21u806ZErMLUuismuWrRg6Jog+OY7+ydIsqlYOq6hdCUUzgNvSQlcPvkT9Lu6XefQLAOMD+ADv1EVMO5rXT2IM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0299
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/8/21 09:08, Christoph Hellwig wrote:=0A=
> Use memcpy_to_bvec instead of opencoding the logic.=0A=
>=0A=
> Signed-off-by: Christoph Hellwig <hch@lst.de>=0A=
=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
