Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEEB312AD8
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 07:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhBHGkj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 01:40:39 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:1805 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhBHGkh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 01:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612766436; x=1644302436;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=KH/MP3wrpK5GNFynkfDCNRcKwL44QQw9Zv4abn+kefM=;
  b=OC/rMTawmy39xAlNdwZeGT9u2ulpCsGcIi+9aXf8EphfSz6Ftajhiund
   iKJaQRruPh/vaVKOckcv6uDh0AWy2scN1VQdd/OXFk1b6lbm1nqz6BkaF
   WV7ekq0CDcH+X9N3MwiJuqb7ixEY+EucY3fQLqIqtMZkkxudA/uKdxKba
   NBzAOoXzZwfa0833LdJy4SpnaHfeXNI2v+ubJycBrD5mtimCFv+9V+krV
   cgNTaPnxtkKuw09C59+dBnUyf3sxVsydglNjFST3bzZo6FyP//HSsPyLE
   s/MV4mqgUS7GC4jm1zqPZk7jDjYOrVD6B6J+3GuP2A1e/ON9QR0C/5rs/
   g==;
IronPort-SDR: i52aTEkoBzdR3Y56bUgJhdl/GwEovcnTsFMS8N+alsU9HM8urZd1M/yuc+d1Lvbe1srtKreWM4
 FNPHFqrIpa09ULbreHT0zkHwqIxXpirL9i4svaPrV4iWxgaoz2dVKfvBcloS4En8FWBzaTyS75
 vAoxVxwzF1JyA4Mze9ZTRYFmX1MpvnM7kAyCXyOeJFvGEgDkT1S4KFUuFiTySQ0uRPmaPld8qh
 WllZzGL9CcjbWsBej1pSL7hL769+OMH3YStxzqUKZNEJ/hkRVL+0FQFq7FNMybCjh5BW6OzAep
 8YU=
X-IronPort-AV: E=Sophos;i="5.81,161,1610380800"; 
   d="scan'208";a="269886112"
Received: from mail-co1nam04lp2052.outbound.protection.outlook.com (HELO NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.52])
  by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 14:39:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H35c7FdpHP9i2eGyEUeONhyFkafK9E1WHe3YD3bZoKdTFY57X1TnxmJUKvQeYiXbcgIRWWYhLmICQ3Ixlv3LIhsTlgld1oqVMc0pj/e2rgVxjmpvl8PojVJMnZdUK8V1nuQ0eGPtSv5GSwVdSVT2UXnpFX38rs+sWVdgjE6ONanhX/K38v/m7r3Ny3PjOBw2M3SIpuH1rLmwS5WIslLa4ZMgMbQxkzujpNLS6iHJJCAbjALeVtebV81BR4QsGSZdhG0Xj6fnbCch6PN1b4fQNMqrL1GdB0rbVZ0/rIgxgjJQpQN5ZflaBaoPvaE3bo0P2PLe3BN+wT19EiTIVg6s0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH/MP3wrpK5GNFynkfDCNRcKwL44QQw9Zv4abn+kefM=;
 b=RUlFcKx3dpH7fnGHLwquTisrIz9UkEc761rwaKGE9kpMWRvNXq3RWNu2I/Pw1AxGMKQG2rBfsnJ8OfTQ4AQ3jdCLVOydsGaTKnSE3WzNCUC4LXdzWAN6BjpNK6YS8L4T4tlVJng8+FIoWSvRsdlVAdvESkQl844++axUKA8NYpXpYgnN+m2aQebxAZi4Gk+QlHikSZoaDQMuMC/nUiC1FtpS0E4Zfgvyx7VyhsrKRyLfDVzRolg+qKyjkJkQZrEQVA/8S6q/Fk8xeDWhgyTWruHUaZYXdGHhngsTukeXlYMARmJp1lYZqEoC1VTwCVVIlG2ZCFEvdKXX+D5P/Tbk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH/MP3wrpK5GNFynkfDCNRcKwL44QQw9Zv4abn+kefM=;
 b=Y5GdsKobx9is2d2g3YjuwEjH6wbiZ/Wuu5n4PnmDKHqPCy8PWk7OZ4un0qUTYRP21alO1p/zs357s2Cx5GxC4aKibZjwwh66W4F1Z4dYbkBBuovMIF4KUTlw0KA3nC+Hw2aTlpCOgd4finYWmfaGezuEeTU6rL3w9Zr+EcJSlYQ=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (52.135.233.89) by
 SJ0PR04MB7261.namprd04.prod.outlook.com (20.182.1.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.29; Mon, 8 Feb 2021 06:39:29 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3825.027; Mon, 8 Feb 2021
 06:39:29 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
CC:     Lauri Kasanen <cand@gmx.com>,
        "hch@infradead.org" <hch@infradead.org>,
        "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Thread-Topic: [PATCH v11] block: Add n64 cart driver
Thread-Index: AQHW8V0RPSwnc2UUP06/pmxPHYESZg==
Date:   Mon, 8 Feb 2021 06:39:29 +0000
Message-ID: <BYAPR04MB49656CEB3D04F94633D255B8868F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
 <20210123124210.GB458363@infradead.org>
 <20210206192837.5ecec54cc5ac120ade1d5060@gmx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 92ea7dc6-6c63-4430-8c12-08d8cbfc4931
x-ms-traffictypediagnostic: SJ0PR04MB7261:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR04MB7261E9B3E2C31C45C31392FD868F9@SJ0PR04MB7261.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 95NacspXaTY3JHKybjgXebxFkNAg+zhY+EmjcCbErC6tD13m6YfniQO6l+jntxbGxFRjD+7JIzuX8B6Ew49FyyDwOqafLAOWAW4KKXxOkZcLQndtW295ia0khxn00cU2F2YaA4P1bptHTz1dXEZcaQKgrd032IWuW0zI+hi76jThoVGqIuAMDkOhZ4i+dMwZz5UCXOmxJSOyNPDqjBYn57ZWhm8JJeNi1QMMuKHl2FKxrKum8i5OUVrf25WqoWeaZBgbuH5NGMz7hdmjGir7xt4JMf6v2RpKy0lq0SWWWaOfBE/2MtZjPEoZ6+tXBeH+6MSNwsu3eOo+uObqgHH/rp4Aq8D9rmyyKDDx5t0yvCGiHi8dcqF659gfMD7RqD8wfRkPgbMDdiY655vDAlWgE3pJJckpiyLZybrz05zFO3PMdjCZWdLxUPd5RpxdBHkiTF1JHS43LnzQo5T14lxJRlNeoabzH+2bOiUsbvJS99QjMWrEeMvnLHEvMxFPoTdXQgnmQrbTXFw8iQNnCxrvkdAvM3bi1Uqq6+cvcW3xDno+IM/4ftxhpzJu7hXMsQ5+WIgxVnpzASizLpZX1RQMcWFO48CJgoLa2W3yPTvTLOY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(7696005)(6506007)(26005)(186003)(86362001)(2906002)(4326008)(52536014)(76116006)(478600001)(66556008)(66446008)(4744005)(110136005)(316002)(9686003)(71200400001)(54906003)(8676002)(66946007)(66476007)(966005)(55016002)(53546011)(33656002)(64756008)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?POtcpudGtV6ueF971boyQ3mJUIhKPewgRdwLVLmBK50yHoqHEsteOIo5e7lq?=
 =?us-ascii?Q?1q9POz2oiE2AucHJ4eAqfLPqT9b6VIb9lqe4ZNzZilsHZ/jEjh4xo0SAhOYG?=
 =?us-ascii?Q?+EEijp77eDlUX80wNRZCYZ+TojDgJtlSt82s785ZAzA73Eqrm60Tetdk4Au/?=
 =?us-ascii?Q?vHn9+1fTfPxz/drNNr18f/KFg2wJr0wV6Yl3oR/X/sDaB7UzqeFth6u8uUzC?=
 =?us-ascii?Q?7MdQF7diZNiBcN6Gv3PW1BqacuAkWlJZtTmn333N5PI8T+hCAPIJJsJ6h1Gt?=
 =?us-ascii?Q?JYUJCBdkq3cDe+XqGa6429yn++NWHf8M3IJ3e+EvcijIct+hCKI0KCZQrRCp?=
 =?us-ascii?Q?6o1sVCIWEJvI5m4l1gKh4qvkAKk8i1AbkOLNCVCATXJ88Qg935Llqh9QVVZE?=
 =?us-ascii?Q?GbtepEf+cy+nIpVrEI9rgzy+HYuz2LK7EC/6K69VHAcR64ghcIhpRBEGfCxW?=
 =?us-ascii?Q?RTdEnsp3uNnIm5guPzdZjeOsaj/KymJmwlftDLFq40AyiWNp+HQdw4sx+qP7?=
 =?us-ascii?Q?6XJE3qdlL6sO/2wl+5Ykh3FXdY2XaNBslwKJX6ezm4fIFhYfgVQwhOkIGgRD?=
 =?us-ascii?Q?cbndmYpx3C+Lv9PmtT7fbZqIvxwrA958sK89Pk0jEI91M7qrk1qb8uT5LHZi?=
 =?us-ascii?Q?S7vGypgmeAq/k7340EVGhwENSWgcdQBVFUEp96RS0T1kP3x67Z9piu5RHaE0?=
 =?us-ascii?Q?bsdbcjIGAQ+PjZDjPZyfmvorGSgTYlPRxapG0ug541yTx6Ykzq5jTWd4ZzoX?=
 =?us-ascii?Q?bT5uHMfoNgMazpEFq0z7cW1h5fxm690YtQEGGTx252+rh36hAUS/yQBvUisA?=
 =?us-ascii?Q?yMtzC6INUiam0FEzJ2Un/YXw+LPJ0Bs2qJs62Dagq+VAktSXjHddEOHXES+O?=
 =?us-ascii?Q?vqHWupPfSZ9n56LyJRRWRPlxtYdcUxshhZFzMy05f2VWTBqcZYuyYJYyLiz+?=
 =?us-ascii?Q?nL+JxZS3cmEZgenmT9++YU8ixZD+2cAeJGrvI4ciL84r+ft3tM3hpH3Nc8Oz?=
 =?us-ascii?Q?RPJWo6uJGeFH6wyP7Ux1IIJ/0UemnXSpkRveb1J50a6aEzUobO2h6nbDlAlg?=
 =?us-ascii?Q?rUhyuwv6/BHWRUbW2/itU36/Tr8RVRpQDZ9cMMEBe9IvzBE47fr/1xqxspMU?=
 =?us-ascii?Q?ikUKXMlFt2flS4NLdWkWh1Tog+VvfxPOox6iKZN6M5/zNiXzkDrsDEnoZwNd?=
 =?us-ascii?Q?Fo5lFD8ikYl+ianr+BatIczDxdC0n483l4G6XuvU24mzYKrAzz9UqQ8DWTzB?=
 =?us-ascii?Q?Dcklm4TraGLSclIXpIu6RMIBBAklmj3kbuoMPaA2yF465uux7KVgJdtj7LAs?=
 =?us-ascii?Q?QhuIg4EUs8yoIK+hsMxvv9zq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ea7dc6-6c63-4430-8c12-08d8cbfc4931
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 06:39:29.2276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qba/CrkIDr1MRMdAdkSDBZULlOkGbU5hnDfM1PCf431C9zS2kLuQbi8KA7J7a8fGfTjZQlJegRnsdjWpeUjIel9wEPtSfFP5gnBK3b84K/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7261
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/6/21 09:31, Lauri Kasanen wrote:=0A=
> On Sat, 23 Jan 2021 12:42:10 +0000=0A=
> Christoph Hellwig <hch@infradead.org> wrote:=0A=
>=0A=
>> Looks good,=0A=
>>=0A=
>> Reviewed-by: Christoph Hellwig <hch@lst.de>=0A=
> Hi,=0A=
>=0A=
> Ping on this patch. Thomas, do you want to pick it up?=0A=
>=0A=
> - Lauri=0A=
>=0A=
=0A=
Whoever is going to apply this patch please apply following series on the=
=0A=
top of this one :-=0A=
=0A=
https://www.spinics.net/lists/linux-mips/msg03296.html=0A=
