Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13D910C39
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 19:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfEARki (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 13:40:38 -0400
Received: from mail-eopbgr700102.outbound.protection.outlook.com ([40.107.70.102]:34944
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726069AbfEARki (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 May 2019 13:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KL1l2AfwR4SubBv0dWVJzelYRx3MFtal/g6+bVDW00=;
 b=lqSXhYyieVzcAFd8rCQI0rbCdxr/GiWLhkZz1EaRHekmrgoXaLBm2IUr3wtkplkC4dV/5m7xJkoxvddkb5AywLH/DrWV2sqHGHg32NwSUoW/SZ+OsYgwYHNeP7F3EbjBwVLwhQDts7wo2bE6gRLyhP1NhEpAQULyRR9/9ufGVdY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1342.namprd22.prod.outlook.com (10.174.162.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 1 May 2019 17:40:34 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Wed, 1 May 2019
 17:40:34 +0000
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
Subject: Re: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Thread-Topic: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Thread-Index: AQHU/0QKKKiJlPSrw0CLkNp0FmAaxqZWhWOAgAAC3QCAAAMrgA==
Date:   Wed, 1 May 2019 17:40:34 +0000
Message-ID: <20190501174033.6rj5aiopdeo4uqpw@pburton-laptop>
References: <20190430110032.25301-1-hch@lst.de>
 <20190430110032.25301-5-hch@lst.de>
 <20190501171857.chfxqntvm6r4xrr4@pburton-laptop>
 <20190501172912.GA19375@lst.de>
In-Reply-To: <20190501172912.GA19375@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11320ebd-f605-4a90-aa82-08d6ce5c1d45
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1342;
x-ms-traffictypediagnostic: MWHPR2201MB1342:
x-microsoft-antispam-prvs: <MWHPR2201MB134268D215E3D15FEB9B61A3C13B0@MWHPR2201MB1342.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(396003)(346002)(136003)(39840400004)(366004)(376002)(199004)(189003)(81166006)(386003)(7736002)(6506007)(305945005)(26005)(76176011)(8676002)(186003)(102836004)(66066001)(99286004)(81156014)(2906002)(8936002)(44832011)(52116002)(7416002)(6246003)(486006)(42882007)(476003)(446003)(53936002)(11346002)(256004)(9686003)(316002)(6512007)(33716001)(58126008)(54906003)(3846002)(6116002)(71190400001)(71200400001)(14454004)(229853002)(4326008)(6436002)(68736007)(6486002)(5660300002)(66556008)(66476007)(64756008)(66446008)(66946007)(1076003)(478600001)(4744005)(73956011)(6916009)(25786009)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1342;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n1r4pFRo4Na6zEPiDyzqPWsTDS2hTDeCJjqE0Qa6wcviofhOnEXRtzNS+omazVnnjv0dJjUUY6Lh/ePlwFFdTW7x0wLf0Xh4dv/3b4SmKv3vfD5sOeS5ICgcMvToSEw1F2+hiLfMb8qj6ScdB1TVSrJEj2H9rhnOXLMD7VOv/vyE0iZHV5cw598au47wTOOSu8OKZvvF7TnLpUxO76fyuG3jHBJyGLZRysOMPQy8E6OTxU6r6qZNQdDkKhFnd8+SknyuqKoIC1/y8Bl1VPX9mUs2COKORvQ2DvX/sPqSKRBGXYFE6dSJzs02rF4xrlT6k8TE6SO05WaM0dYMCmKxctsldETeBbJDu7eM4vt8sFWjwmD3rWlyMSAT+WnyeRKt7JvAJVOklfobmthBi/GT/1F6p2wwfYh0huHqR0YRoRo=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08C2B433C072184F9A5FA2B58FD07D3B@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11320ebd-f605-4a90-aa82-08d6ce5c1d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 17:40:34.5854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1342
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

On Wed, May 01, 2019 at 07:29:12PM +0200, Christoph Hellwig wrote:
> On Wed, May 01, 2019 at 05:18:59PM +0000, Paul Burton wrote:
> > I'm not so sure about this part though.
> >=20
> > On MIPS we currently don't clear the allocated memory with memset. Is
> > doing that really necessary?
>=20
> We are clearling it on mips, it is inside dma_direct_alloc_pages.

Ah, of course, I clearly require more caffeine :)

> > If it is necessary then as-is this code will clear the allocated memory
> > using uncached writes which will be pretty slow. It would be much more
> > efficient to perform the memset before arch_dma_prep_coherent() & befor=
e
> > converting ret to an uncached address.
>=20
> Yes, we could do that.

Great; using cached writes would match the existing MIPS behavior.

Thanks,
    Paul
