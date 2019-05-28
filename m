Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F95D2D0C6
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2019 23:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfE1VB4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 17:01:56 -0400
Received: from mail-eopbgr760138.outbound.protection.outlook.com ([40.107.76.138]:9138
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726683AbfE1VB4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 May 2019 17:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tH+y2b9lipU3SuRJXgZwb3QsKuinj1Fiqka767HxIw=;
 b=dqQsV3tgTaSPcvyri8+UTt57foMzVxVIfMS001J+Cht4f1cLywed0p2ACe1SHSZKidRbNXIQ47RZsxT2LoGuz/RxynCQ7G9ovQEpmuWwzdzGjBDir3OtfDePZcEM6KFZOMQm6vbxNlLsJH+9F0yLToOpsJGNVE6Ykn0hyoA72o4=
Received: from BN6PR2201MB1266.namprd22.prod.outlook.com (10.174.80.14) by
 BN6PR2201MB1715.namprd22.prod.outlook.com (10.161.158.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 21:01:12 +0000
Received: from BN6PR2201MB1266.namprd22.prod.outlook.com
 ([fe80::201e:2693:29da:37de]) by BN6PR2201MB1266.namprd22.prod.outlook.com
 ([fe80::201e:2693:29da:37de%3]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 21:01:12 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
CC:     "ralf@linux-mips.org" <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
Subject: Re: MIPS r4k cache operations with SMP enabled
Thread-Topic: MIPS r4k cache operations with SMP enabled
Thread-Index: AQHVFQB0Z16/xM5TvUKYi9+2ojSGN6aBBvGA
Date:   Tue, 28 May 2019 21:01:11 +0000
Message-ID: <20190528210109.npyv64vdcfvy5owk@pburton-laptop>
References: <d87063da1d104af8a040f5f25a588638@svr-chch-ex1.atlnz.lc>
 <1109cb84e36e483fb22c30a60ab4a6ff@svr-chch-ex1.atlnz.lc>
In-Reply-To: <1109cb84e36e483fb22c30a60ab4a6ff@svr-chch-ex1.atlnz.lc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To BN6PR2201MB1266.namprd22.prod.outlook.com
 (2603:10b6:405:20::14)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df567ec6-a08b-4031-3dff-08d6e3af9d2a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BN6PR2201MB1715;
x-ms-traffictypediagnostic: BN6PR2201MB1715:
x-microsoft-antispam-prvs: <BN6PR2201MB17156F4AB433A7CB9FC8E395C11E0@BN6PR2201MB1715.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(346002)(396003)(376002)(39850400004)(366004)(189003)(199004)(66066001)(42882007)(81156014)(76176011)(1076003)(6512007)(9686003)(4326008)(3846002)(446003)(44832011)(52116002)(33716001)(53546011)(6916009)(25786009)(99286004)(11346002)(486006)(476003)(6506007)(386003)(6486002)(102836004)(6116002)(186003)(14454004)(8676002)(256004)(14444005)(305945005)(316002)(66476007)(71200400001)(2906002)(53936002)(66946007)(6436002)(81166006)(8936002)(58126008)(229853002)(54906003)(7736002)(478600001)(26005)(6246003)(5660300002)(68736007)(73956011)(71190400001)(66556008)(66446008)(64756008)(42413003);DIR:OUT;SFP:1102;SCL:1;SRVR:BN6PR2201MB1715;H:BN6PR2201MB1266.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9Atuci/D2Vz758nlcq0PUiiDUYGrjqsKt9nB+kZ0fPuSTCSHaWA3ehfQWm0jWjMnxMJPCKfSV689ux/WTgfmoK6pYgc8HMGXBKbfNEZgGaPE6vVDx8T2VSAfG41SObYEb+EDuHtAKxc5z7SZg+e9ZSW5HL9+0MwFni9ZuacC1/8YH/vuzpIFmXDsrZViSadnZhuge+KI3t/XC/LNVwbapZy0y3uS4ZpWpNXKapGgTseCNmw4e0QpeiRisFBtqIZh+dPO9Biww02BMrtiOFdFRk4NlaleS3UyRM43pTWnDKwCbIyv2i1slSrflSqWvQMKnkeDpHwkOmfV2mdFNctmjvX/LBhNlRdGCce2fV9Id5shYrt+4av4tOhGQEcLLU8AQ5nnktiI+CyPo0EOx9GCalv4BWsZeyK2KQE8rokYG18=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <136F037EF694454F975F8B46F4631764@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df567ec6-a08b-4031-3dff-08d6e3af9d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 21:01:11.9140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR2201MB1715
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Chris,

On Tue, May 28, 2019 at 05:19:37AM +0000, Chris Packham wrote:
> On 28/05/19 2:52 PM, Chris Packham wrote:
> > Hi,
> >=20
> > I'm trying to port a fairly old Broadcom integrated chip (BCM6818) to
> > the latest Linux kernel using the mips/bmips support.
> >=20
> > The chip has a BMIPS4355 core. This has two "thread processors" (cpu
> > cores) with separate I-caches but a shared D-cache.
> >=20
> > I've got things booting but I encounter the following BUG()
> >=20
> > BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0=
/1
> > caller is blast_dcache16+0x24/0x154
> > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.1.0-at1 #5
> > Stack : 00000036 8008d0d0 806a0000 807c0000 80754e10 0000000b 80754684
> > 8f831c8c
> >           80900000 8f828424 807986e7 8071348c 00000000 10008f00 8f831c3=
0
> > 7fb69e2a
> >           00000000 00000000 80920000 00000056 00002335 00000000 807a000=
0
> > 00000000
> >           6d6d3a20 00000000 00000056 73776170 00000000 ffffffff 10008f0=
1
> > 807c0000
> >           80790000 00002cc2 ffffffff 80900000 00000010 8f83198c 0000000=
0
> > 80900000
> >           ...
> > Call Trace:
> > [<8001c208>] show_stack+0x30/0x100
> > [<8063282c>] dump_stack+0x9c/0xd0
> > [<802f1cec>] debug_smp_processor_id+0xfc/0x110
> > [<8002e274>] blast_dcache16+0x24/0x154
> > [<80122978>] map_vm_area+0x58/0x70
> > [<80123888>] __vmalloc_node_range+0x1fc/0x2b4
> > [<80123b54>] vmalloc+0x44/0x50
> > [<807d15d0>] jffs2_zlib_init+0x24/0x94
> > [<807d1354>] jffs2_compressors_init+0x10/0x30
> > [<807d151c>] init_jffs2_fs+0x68/0xf8
> > [<8001016c>] do_one_initcall+0x7c/0x1f0
> > [<807bee30>] kernel_init_freeable+0x17c/0x258
> > [<80650d1c>] kernel_init+0x10/0xf8
> > [<80015e6c>] ret_from_kernel_thread+0x14/0x1c
> >=20
> > In blast_dcache16 current_cpu_data is used which invokes
> > smp_processor_id() triggering the BUG(). I can fix this by sprinkling
> > preempt_disable/preempt_enable through arch/mips/mm/c-r4k.c but that
> > seems kind of wrong. Does anyone have any suggestion as to the right wa=
y
> > to avoid this BUG()?

Ah, cache aliasing, will it ever cease to provide suprises? :)

> I think the following might do the trick
>=20
> ---- 8< ----
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index 5166e38cd1c6..1fa7f093b59c 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -559,14 +559,19 @@ static inline int has_valid_asid(const struct=20
> mm_struct *mm, unsigned int type)
>          return 0;
>   }
>=20
> -static void r4k__flush_cache_vmap(void)
> +static inline void local_r4k_flush_cache(void *args)
>   {
>          r4k_blast_dcache();
>   }
>=20
> +void r4k__flush_cache_vmap(void)
> +{
> +       r4k_on_each_cpu(R4K_INDEX, local_r4k_flush_cache, NULL);
> +}
> +
>   static void r4k__flush_cache_vunmap(void)
>   {
> -       r4k_blast_dcache();
> +       r4k_on_each_cpu(R4K_INDEX, local_r4k_flush_cache, NULL);
>   }
>=20
>   /*
> @@ -1758,6 +1763,43 @@ static int __init cca_setup(char *str)
>          return 0;
>   }
> ---- 8< ----
>=20
> The rest of the call sites for r4k_blast_dcache() already run with=20
> preemption disabled.

That looks reasonable, but I'm wondering why these are separate to our
implementation of flush_kernel_vmap_range(). The latter already handles
SMP & avoids flushing the whole dcache(s) when the area to flush is
smaller than the cache.

Would it work to just redefine flush_cache_vmap() & flush_cache_vunmap()
as calls to flush_kernel_vmap_range?

Thanks,
    Paul
