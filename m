Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECEE102F1
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 00:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfD3W6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 18:58:39 -0400
Received: from mail-eopbgr750132.outbound.protection.outlook.com ([40.107.75.132]:24393
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726102AbfD3W6j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 18:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wSTc+nSzbhvb3vZPkDndqCAWSHfo+ILB9lcdNYYBls=;
 b=I9ED5Fy7sc3h7Y6l4wXSVVgfppFMHg26FHvzQjO7uDi8wNawv7NSJfuOQMr91qc2Ch1zuh3G80QOXBk1FE4tYN0pgf1t4wcaUnvMXEGwjTCNMk0lBbvAMpJJvvc6p8KfgKlAkvQhFAqBJFnSTuErdmifbfIgrq2633M9vJiqcnQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1744.namprd22.prod.outlook.com (10.164.206.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 22:58:33 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 22:58:33 +0000
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
Thread-Index: AQHU+ibQQIEJaXUkgEWNBapHcAUrdaZL6giAgAGn0ACAB8pRAA==
Date:   Tue, 30 Apr 2019 22:58:33 +0000
Message-ID: <20190430225832.cjk7mj6dotw3cib6@pburton-laptop>
References: <20190423224748.3765-1-fancer.lancer@gmail.com>
 <20190423224748.3765-5-fancer.lancer@gmail.com>
 <20190424224343.4skr727fszycwksq@pburton-laptop>
 <20190426000035.yfonfvrapmm4j3fg@mobilestation>
In-Reply-To: <20190426000035.yfonfvrapmm4j3fg@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8703eca8-92fe-4aa6-ac3a-08d6cdbf5ee7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1744;
x-ms-traffictypediagnostic: MWHPR2201MB1744:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB1744827D6BFBB405171FD301C13A0@MWHPR2201MB1744.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(39850400004)(396003)(136003)(376002)(346002)(51444003)(189003)(199004)(52116002)(478600001)(76176011)(66946007)(66476007)(7416002)(54906003)(44832011)(476003)(73956011)(42882007)(99286004)(6506007)(64756008)(58126008)(66556008)(33716001)(1076003)(446003)(14454004)(316002)(26005)(386003)(486006)(66446008)(66066001)(11346002)(186003)(7736002)(25786009)(305945005)(102836004)(6246003)(6486002)(53936002)(6916009)(229853002)(8676002)(81156014)(81166006)(3846002)(5660300002)(6512007)(6306002)(68736007)(71190400001)(71200400001)(9686003)(2906002)(8936002)(6436002)(256004)(6116002)(966005)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1744;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 08x5VgZdrekKyTBipVEOTlyMt6uAssa9K/eOFLGJVmYYpXCOOJKubL3sgV1DQBN352jfyHGmfxzrwr93De2/cpPg4GBga02hZVTooOp7KZkwOTO3T6KJf2buQHDAgT4vie4egl+E8XoobbCmdyK85AyaIZ1EVIPf6mdDyAQLBZyUYWxZV4G4r2V3nAvp6XKnNsX7s0htVwT71tG53zzF86fRf/trUXOt5us2zRn525y8b1VAu+99B2pYq1Gg7jqU6Yk1DBRjveJGYoVu3jq190IquteZgLB8jcSVLbfX2Oo0/06vw+xvQRFylQ8N8gIchZZ/vHKB3vzEmIxWqyqvhfXAy6tFidS6KoXSa7dn3UVnUaqJqNOea/hOeqQP7aM16c6IA6poYKTmhi6Vg5H70HbG7cBDIytxFAkLYsfIdQA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31CA1FFD45D7C846A8B813AF16D3E80F@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8703eca8-92fe-4aa6-ac3a-08d6cdbf5ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:58:33.8286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1744
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On Fri, Apr 26, 2019 at 03:00:36AM +0300, Serge Semin wrote:
> >  1) Older systems generally had something like an ISA bus which used
> >     addresses below the kernel, and bootloaders like YAMON left behind
> >     functions that could be called right at the start of RAM. This sort
> >     of thing should be accounted for by /memreserve/ in DT or similar
> >     platform-specific reservations though rather than generically, and
> >     at least Malta & SEAD-3 DTs already have /memreserve/ entries for
> >     it. So this part I think is OK. Some other older platforms might
> >     need updating, but that's fine.
> >=20
>=20
> Regarding ISA. As far as I remember devices on that bus can DMA only to t=
he
> lowest 16MB. So in case if kernel is too big or placed pretty much high,
> they may be left even without reachable memory at all in current
> implementation.

Sure - I'm not too worried about these old buses, platforms can continue
to reserve the memory through DT or otherwise if they need to.

> >  2) trap_init() only allocates memory for the exception vector if using
> >     a vectored interrupt mode. In other cases it just uses CAC_BASE
> >     which currently gets reserved as part of this region between
> >     PHYS_OFFSET & _text.
> >=20
> >     I think this behavior is bogus, and we should instead:
> >=20
> >     - Allocate the exception vector memory using memblock_alloc() for
> >       CPUs implementing MIPSr2 or higher (ie. CPUs with a programmable
> >       EBase register). If we're not using vectored interrupts then
> >       allocating one page will do, and we already have the size
> >       calculation for if we are.
> >=20
> >     - Otherwise use CAC_BASE but call memblock_reserve() on the first
> >       page.
> >=20
> >     I think we should make that change before this one goes in. I can
> >     try to get to it tomorrow, but feel free to beat me to it.
> >=20
>=20
> As far as I understood you and the code this should be enough to fix
> the problem:
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 98ca55d62201..f680253e2617 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2326,6 +2326,8 @@ void __init trap_init(void)
>  				ebase +=3D (read_c0_ebase() & 0x3ffff000);
>  			}
>  		}
> +
> +		memblock_reserve(ebase, PAGE_SIZE);
>  	}
> =20
>  	if (cpu_has_mmips) {
> ---
>=20
> Allocation has already been implemented in the if-branch under the
> (cpu_has_veic || cpu_has_vint) condition. So we don't need to change
> there anything.
> In case if vectored interrupts aren't supported the else-clause is
> taken and we need to reserve whatever is set in the exception base
> address variable.
>=20
> I'll add this patch between 3d and 4th ones if you are ok with it.

I think that would work, but I have other motivations to allocate the
memory in non-vectored cases anyway. I just sent a series that does that
& cleans up a little [1]. If you could take a look that would be great.
With that change made I think this patch will be good to apply.

Thanks,
    Paul

[1] https://lore.kernel.org/linux-mips/20190430225216.7164-1-paul.burton@mi=
ps.com/T/#t
