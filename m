Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6D510BD2
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 19:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbfEAROB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 13:14:01 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:52973
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726005AbfEAROB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 May 2019 13:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HABJON+PUwKKspjD9/5rvoUoFvtxnRJTtI3uP9m84jA=;
 b=mCxlssX/fSUbWEVb2VVYdxuzP6WTJXUoID7oXybpmZtZVwXaaUwA6oDPteNnndFZnjcms3WVbEk0dOF3DlZqKIX7AfYJZP4sJmCbYRtdw60uIVrSxajoSw9KnZsTqvAgS57jzMC7IzyRbPDt9Kp6+5jrtJIrn0lz0wT4pi/eiYQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1360.namprd22.prod.outlook.com (10.174.162.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 1 May 2019 17:13:57 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Wed, 1 May 2019
 17:13:57 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 5/7 v2] MIPS: use the generic uncached segment support in
 dma-direct
Thread-Topic: [PATCH 5/7 v2] MIPS: use the generic uncached segment support in
 dma-direct
Thread-Index: AQHVAB+93knDJH4MwEqQLib+MMfMNKZWgkOA
Date:   Wed, 1 May 2019 17:13:57 +0000
Message-ID: <20190501171355.7wnrutfnax5djkpx@pburton-laptop>
References: <20190430110032.25301-1-hch@lst.de>
 <20190430110032.25301-6-hch@lst.de>
 <20190430201041.536amvinrcvd2wua@pburton-laptop>
 <20190430202947.GA30262@lst.de>
 <20190430211105.ielntedm46uqamca@pburton-laptop>
 <20190501131339.GA890@lst.de>
In-Reply-To: <20190501131339.GA890@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11d33d32-661c-4be2-e2ef-08d6ce586500
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1360;
x-ms-traffictypediagnostic: MWHPR2201MB1360:
x-microsoft-antispam-prvs: <MWHPR2201MB1360446168387E44DE27414AC13B0@MWHPR2201MB1360.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(44832011)(71190400001)(71200400001)(486006)(4744005)(6436002)(6486002)(1076003)(476003)(11346002)(6506007)(386003)(8676002)(73956011)(102836004)(26005)(81166006)(81156014)(478600001)(6116002)(3846002)(66946007)(229853002)(305945005)(2906002)(7736002)(446003)(256004)(66476007)(64756008)(66446008)(66556008)(7416002)(6916009)(8936002)(4326008)(68736007)(33716001)(6512007)(52116002)(76176011)(99286004)(53936002)(42882007)(6246003)(9686003)(5660300002)(66066001)(316002)(186003)(58126008)(54906003)(14454004)(25786009)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1360;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RyJnvgB3VbpTL1lCiqOR1TUJLbWECPHaCuWA4fJ4a25biAZrmmqnIY/y4PaIgDe+k9ZqYq6Kue008thEQ7/ViQ0msPhX/yfaRI4Lu1LwY0MUXoN9ZHu0fWjLG1cN53DkiOjeJ17ykF8TOzIYyWDCnhN4AwRHESAlxD5kGqKCkJjiKX4wqU41M9uxtrB6pNYbmBe1478S51AbWB0ZceRXxMX0lpP5EuF1C9GJYOlvXvGVIlEinM4Y8iyJpdQk6FQwXM4TzOSuWZwBO4GjFt4f6MSKj6bhnToCXk4jvAzHre8aQFrce1x0zNCKn80ju95fNSN1mhqRloSJxq8uPM+Ty44XPZeB+xEbJ/YCDZlPhjPnwsS3J70XuYQV9KemHV8BNMyOOZY3IuIzSL7FdDWmRWrv2vEECO89rI8SxzaLvZ8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F14412FE76975045800B7CCED7EAD807@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d33d32-661c-4be2-e2ef-08d6ce586500
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 17:13:57.6422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1360
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

On Wed, May 01, 2019 at 03:13:39PM +0200, Christoph Hellwig wrote:
> Stop providing our arch alloc/free hooks and just expose the segment
> offset instead.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/Kconfig              |  1 +
>  arch/mips/include/asm/page.h   |  3 ---
>  arch/mips/jazz/jazzdma.c       |  6 ------
>  arch/mips/mm/dma-noncoherent.c | 26 +++++++++-----------------
>  4 files changed, 10 insertions(+), 26 deletions(-)

This one looks good to me now, for patches 1 & 5:

  Acked-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul
