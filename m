Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046DF1019C
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2019 23:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfD3VLL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 17:11:11 -0400
Received: from mail-eopbgr810107.outbound.protection.outlook.com ([40.107.81.107]:6212
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726015AbfD3VLL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 17:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5fuRto6oEUcT+2UnhpiHB/MeHMXoTp2Vo1GAYaMOJA=;
 b=ihDo8jQ8VenrmLIPMtw+x6xzB7BIHZCNUIaZ5KnA3xxIMvSkTy7sVA+hjPbsoM4QcdHhodczxAjHvjKuD/nlATqQG/HKQPcTDEzohfLH8VsuS2XkUXzaUFEM3AKRMQYhZw1ts9L3Tc0y55JoFpu1YO/8/XA5Tx1/o35xn6onLPc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1342.namprd22.prod.outlook.com (10.174.162.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 21:11:07 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 21:11:07 +0000
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
Subject: Re: [PATCH 5/7] MIPS: use the generic uncached segment support in
 dma-direct
Thread-Topic: [PATCH 5/7] MIPS: use the generic uncached segment support in
 dma-direct
Thread-Index: AQHU/0QLF7/q9Iq7YkyidXRkO+31J6ZVIwmAgAAFVoCAAAuKgA==
Date:   Tue, 30 Apr 2019 21:11:07 +0000
Message-ID: <20190430211105.ielntedm46uqamca@pburton-laptop>
References: <20190430110032.25301-1-hch@lst.de>
 <20190430110032.25301-6-hch@lst.de>
 <20190430201041.536amvinrcvd2wua@pburton-laptop>
 <20190430202947.GA30262@lst.de>
In-Reply-To: <20190430202947.GA30262@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::43) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7be7f2c6-05cb-43f5-3353-08d6cdb05c65
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1342;
x-ms-traffictypediagnostic: MWHPR2201MB1342:
x-microsoft-antispam-prvs: <MWHPR2201MB1342B87D3043A05F1CB25697C13A0@MWHPR2201MB1342.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(376002)(136003)(396003)(39850400004)(366004)(189003)(199004)(256004)(33716001)(476003)(446003)(3846002)(53936002)(9686003)(2906002)(11346002)(6246003)(7416002)(44832011)(486006)(66446008)(58126008)(52116002)(54906003)(6512007)(76176011)(66946007)(305945005)(66556008)(73956011)(6116002)(64756008)(7736002)(42882007)(1076003)(66066001)(66476007)(229853002)(4744005)(102836004)(316002)(6506007)(26005)(81156014)(386003)(8676002)(25786009)(99286004)(14454004)(71200400001)(71190400001)(478600001)(4326008)(186003)(5660300002)(6436002)(81166006)(6486002)(8936002)(68736007)(6916009)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1342;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Oou6dGQ05SuIRbNW26WOJfH4h74lpio/jhOb/CK071+gqjuVxIehKEZ3Lxbq+Ue3vpSp9pFj6lFK0kgMfzhca4G/07YiEk93sZsumWNJwknfKaNSSSd0oVuFtZSdTVl8T2KohoddnbReaWJhJadHjNWl05hWdj+USnwQG/zDNnwHlGq98U7Z3io8jQMM0mDCwDxrpYtafiQGoI9XF7vICxjo/8SPpzQ/YP2Fiq0b4PnCESXhBjfcOlX1cOGhQGfHyeUOsjkKT0yhDCRI8op6sBZpSQhHoeRICIH5q7mDq9J8wgolElH6sIP//86zQIQgssZSxhsyfk3vgY38V97eVMfrq9mjUwrE6pJBNfTIuJzjRcmIJNIL19ciagR/zKom+2bpWLHHVq6vh+UVqvw/li6I45M5S+qpVLcrkw0z/so=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE61B5D62A760A468D987D7B2CA91D7A@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be7f2c6-05cb-43f5-3353-08d6cdb05c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 21:11:07.3022
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

On Tue, Apr 30, 2019 at 10:29:47PM +0200, Christoph Hellwig wrote:
> On Tue, Apr 30, 2019 at 08:10:43PM +0000, Paul Burton wrote:
> > This series looks like a nice cleanup to me - the one thing that puzzle=
s
> > me is the !PageHighMem check above.
> >=20
> > As far as I can see arch_dma_prep_coherent() should never be called wit=
h
> > a highmem page, so would it make more sense to either drop this check o=
r
> > perhaps wrap it in a WARN_ON()?
>=20
> dma_alloc_from_contigous can return highmem pages depending on where
> the CMA area is located.  But given that these pages don't have a
> direct kernel mapping we also shouldn't have to flush the caches
> for them.

Right but dma_direct_alloc_pages() already checks for the PageHighMem
case & returns before ever calling arch_dma_prep_coherent(), no?

Thanks,
    Paul
