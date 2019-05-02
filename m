Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D05001221A
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 20:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfEBSpm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 14:45:42 -0400
Received: from mail-eopbgr810134.outbound.protection.outlook.com ([40.107.81.134]:30016
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbfEBSpl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 14:45:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Igez3ZhEECzuniXIZs4JvulGrVB7TtxjPe1FB6QvZ38=;
 b=Xsp6jgyURzBCjrhgt9abYo/IfGt/9IkkgZ3EV5eOP6Gd6BIwINJ2oifOxOqfNaWEsH8rcv50tPvBZlOntEBlbPfijuRDLAep8zoIdO1stjqczwsb0RsuzDF/RfxLStUgn6z2lSKjO7RLbv0cd4Sf0rZtzYNVD0IsFxq8NYPrmU0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1053.namprd22.prod.outlook.com (10.174.169.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Thu, 2 May 2019 18:45:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 18:45:39 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/12] mips: Reserve memory for the kernel image resources
Thread-Topic: [PATCH 04/12] mips: Reserve memory for the kernel image
 resources
Thread-Index: AQHU+ibQQIEJaXUkgEWNBapHcAUrdaZL6giAgAGn0ACAB8pRAIAClRSAgABI7QA=
Date:   Thu, 2 May 2019 18:45:39 +0000
Message-ID: <20190502184537.ccxnrh6x7vg55kly@pburton-laptop>
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <20190424224343.4skr727fszycwksq@pburton-laptop>
 <20190426000035.yfonfvrapmm4j3fg@mobilestation>
 <20190430225832.cjk7mj6dotw3cib6@pburton-laptop>
 <20190502142434.mpoyu4hhbunur5xe@mobilestation>
In-Reply-To: <20190502142434.mpoyu4hhbunur5xe@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::46) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b02fd9b4-3310-4561-a12b-08d6cf2e5f34
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1053;
x-ms-traffictypediagnostic: MWHPR2201MB1053:
x-microsoft-antispam-prvs: <MWHPR2201MB1053FEC62A21FB2B4BB800E2C1340@MWHPR2201MB1053.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(346002)(376002)(136003)(39850400004)(396003)(199004)(189003)(51914003)(66446008)(99286004)(6506007)(7736002)(66946007)(66556008)(66476007)(64756008)(66066001)(8676002)(8936002)(186003)(256004)(102836004)(26005)(73956011)(305945005)(81166006)(71200400001)(81156014)(71190400001)(386003)(1076003)(6916009)(6486002)(11346002)(25786009)(6116002)(6436002)(486006)(58126008)(6512007)(76176011)(3846002)(44832011)(229853002)(7416002)(42882007)(9686003)(53936002)(446003)(33716001)(54906003)(2906002)(478600001)(316002)(52116002)(5660300002)(4326008)(6246003)(68736007)(476003)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1053;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZthgMNS03g/4hPaeXHz38VMJU63bxwNgWWH0xhqIclKoybESnGYKhpntcvpV1KEQfsmhFU28xAsbB1tQHFQERgSVxk9aLCaeXxY6DZFyJNZjjAT9mVP4tc4sBUXFzkBpmEBpqm39t1NTBCvjRMTmK82Yt8npGyu3/gDMNgol5mAZUQXh+vWY25gn6W0aRj9rngqmQoINb9UmUC+Jcw/XhnLFGyDmUzwGPhNKNpDM/0AV70XT/vuFLDDxexhWIT+OkxRT4YvBxXFV/bPK3TFC7rVeWB84ffnugwTtxjva/VyfUseFyYbWNtW6liKuy06XLYvigrdivmMvWwOtY+26OiS4nwpQFRADRjv4YdE6Q7G6AUPZR1AbKaiGdB9T9o2TxHCW3f0UYZt7mdE7ECvkKlGj2/K7yn3s1vl+Ltau+MQ=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC4A28D6B9FB4C4DACE9B3C37428CD5A@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b02fd9b4-3310-4561-a12b-08d6cf2e5f34
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 18:45:39.5556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1053
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On Thu, May 02, 2019 at 05:24:37PM +0300, Serge Semin wrote:
> Just reviewed and tested your series on my machine. I tagged the whole se=
ries
> in a response to the cover-letter of [1].

Thanks for the review & testing; that series is now in mips-next.

> Could you please proceed with this patchset review procedure? There are
> also eight more patches left without your tag or comment.  This patch
> is also left with no explicit tag.
>=20
> BTW I see you already applied patches 1-3 to the mips-next, so what shall=
 I
> do when sending a v2 patchset with fixes asked to be provided for patch 1=
2
> and possibly for others in future? Shall I just resend the series without=
 that
> applied patches or send them over with your acked-by tagges?

I've so far applied patches 1-7 of your series to mips-next, and stopped
at patch 8 which has a comment to address.

My preference would be if you could send a v2 which just contains the
remaining patches (ie. patches 8-12 become patches 1-5), ideally atop
the mips-next branch.

The series looks good to me once the review comments are addressed, but
no need to add an Acked-by - it'll be implicit when I apply them to
mips-next.

Thanks,
    Paul
