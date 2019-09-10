Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79C1DAE19B
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2019 02:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390317AbfIJAMy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Sep 2019 20:12:54 -0400
Received: from mail-eopbgr720113.outbound.protection.outlook.com ([40.107.72.113]:31712
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390303AbfIJAMy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 9 Sep 2019 20:12:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo5wMBfN7mJHjumQ3ZNhaaif4EnGjJLgy0pqffcLtzb+cQkkhlI9dRlfND+GSqsFEYO0r/Yzsv5d3TSKDCnk1ZNIl3/YdjK9Rdoa+JQwtFYb9dlqWrrxHOSpDKazluAXH0/EZyxsBrKDURfQS5SlZyV5vnZuGupSYt8WUnw0uN1b2dgn1aGyCGSEDHRt2xAu8kFjq0B1PelMMRdKhkuNxeKbF2yNL79/9ZrXVJ+s06ykFzVxL47lMorEEwrgsBozZm8LW4oen8Ymzg2enSK7DobeIi+MYvKRE3L0J1cLeHqVVEpXyPI42RDPhFXdv6lggu+innHbZJztwjJSztYIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljh2jsS4AGqHrqoVwrwqizyvTSrzOUGLkNZyzf2Eps8=;
 b=esAw0LVVqnrZWWn8U9AoAeuXzG6MoBwALDSICVvHdZuIPnDOufws5uSMzV7TXTTSgU7ue596U6emUOZs1uYY8PXy/n7ov5W3d4nhLhGj3IEFqDPqn9bYjLAqRQ0xreDdiRlJp/qW8lbXyq3DEwIgogo+5r3y3xZhBWu0bjcWj2Xf1WbrvAuAuz2f3X71So8M5vvrDjnp0XcbJG78xhrfiWgbVa45IXBIFyojObBfXhpmw+3tsVvI1cjRfsXFkl9vnIxsn4PVIF9Zz5Tzg/M9ntmU570ZZusdDMAexmob/tHhjeH5IIeFHCF4dRmP4uMoX+MbeLzDy6KX8KfmRAGd/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljh2jsS4AGqHrqoVwrwqizyvTSrzOUGLkNZyzf2Eps8=;
 b=BuMOQkbR9HL1Q926uTKv0BGO1L8gYkpMBke93ER2avZWNNK3Qe1dUuhQtbJalQENYOHiphE0l91d/ZKloG1/LC3myzJMZlGbkbPbBsvVm8lL5dMLwmcZvxtZkfs6x2s8XUk/AzK2oT2Adbs8fGBb7yFknl7AguDwgQ8X6STxRW0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1152.namprd22.prod.outlook.com (10.174.167.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Tue, 10 Sep 2019 00:12:50 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2241.018; Tue, 10 Sep
 2019 00:12:50 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.co" <mark.rutland@arm.co>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 02/19] MIPS: Loongson64: separate
 loongson2ef/loongson64 code
Thread-Topic: [PATCH v2 02/19] MIPS: Loongson64: separate
 loongson2ef/loongson64 code
Thread-Index: AQHVZ2x7s9cB9C8WRkqS1WFEbLqHmw==
Date:   Tue, 10 Sep 2019 00:12:49 +0000
Message-ID: <20190910001248.few7zmxsrg72mdum@pburton-laptop>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-3-jiaxun.yang@flygoat.com>
In-Reply-To: <20190905144316.12527-3-jiaxun.yang@flygoat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b266151-4478-4aeb-8984-08d735839d47
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1152;
x-ms-traffictypediagnostic: MWHPR2201MB1152:
x-microsoft-antispam-prvs: <MWHPR2201MB1152697E11F0C0618D05BAC7C1B60@MWHPR2201MB1152.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(396003)(39850400004)(366004)(136003)(376002)(199004)(189003)(52314003)(305945005)(7736002)(6486002)(52116002)(229853002)(110136005)(54906003)(30864003)(99286004)(316002)(14444005)(256004)(5660300002)(66066001)(3846002)(6116002)(25786009)(2501003)(7416002)(33716001)(4326008)(1076003)(64756008)(66446008)(76176011)(66476007)(386003)(6506007)(66946007)(478600001)(42882007)(186003)(102836004)(58126008)(26005)(71200400001)(71190400001)(6436002)(446003)(2906002)(53936002)(8936002)(8676002)(81166006)(81156014)(6512007)(9686003)(44832011)(14454004)(6246003)(486006)(11346002)(476003)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1152;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G992zPrr/UyjYGViB6bQk3Y2xSA5NLavk+Rf5RtcnCLVUCQeLg12xJGNzf4qvXq24lSzIRQyWT868BGl97QUjTgQcG30cBCg/dSm+Yz4RFoQscMot2V+ZFKExApj5B8rm7VW1c2Xyg7tVgT7wX4cDMoxvusTfkHV8VG5FQRdYgAEnunKOoQXP/EJ3LLobFgvF58A9RU4qa87ldpKKOoWQ7QF2YxPbnvNPjyw2Fhxpcpjs+EJijqdFOo/CXMOlkLiQdfNbMdj+wetgnjzKoq9Uy5VGzZv6FgTMvRQGzZPThYi2o5hPZcfDk01Yv7xkme3g5B5jOJdTivy1TgAwzZOQRmsNjGkl6+bK4oXxUa/ikv+AuLjJV3h8MIYijbyBHpcaBNRy1FZfEG6QXPJ60ApsI9pgAMhVecR1hC6mpyqJ5M=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9954A55BAF02BB4E8DCD3606A05CE45B@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b266151-4478-4aeb-8984-08d735839d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 00:12:49.6151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yM8TxRL9o+Wp5Rpg+sRveOgmI2CG/M4W9Ul2THBb7FLy+9hkkuim0TxIts/8ip6J2v8wE3acpDLCdtUOxhKfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1152
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun & Huacai,

On Thu, Sep 05, 2019 at 10:42:59PM +0800, Jiaxun Yang wrote:
> As later model of GSx64 family processors including 2-series-soc have
> similar design with initial loongson3a while loongson2e/f seems less
> identical, we separate loongson2e/f support code out of mach-loongson64
> to make our life easier.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I looked at applying the first 3 patches of this series to mips-next &
squashed in the relevant defconfig updates, then was looking at applying
Huacai's recent 3 patch series.

One issue is that they conflict, but beyond that it showed me that this
patch deletes kernel-entry-init.h entirely. Was that intentional? If so
it should be a separate patch & it needs an explanation.

Please could the two of you make it clear what branch & commit your
patches are based upon? Ideally it should be the current head of the
mips-next branch.

Also Jiaxun, it's really hard to see whether this patch is making any
functional changes in addition to the duplication & renaming. I think it
would be much better to split this into a few steps across multiple
commits, something like this:

1) Copy the loongson64 directory to loongson2ef, and keep the copy as-is
   *except* for the removal of the loongson2ef/loongon-3 subdirectory.
   Delete loongson64/fuloong-2e & loongson64/lemote-2f.

2) Now clean up the loongson64 directory by moving files up from the
   loongson-3 subdirectory.

3) Now clean up code, removing #ifdef's etc that no longer make sense.

Provide the -M & -C flags to git format-patch when generating your
patches. --find-copies-harder might help with the first step, if it's
practical to run.

That way each commit will be easier to review, and issues like the
deletion of kernel-entry-init.h will be easier to spot.

For now I undid the whole thing. It's getting late in the cycle anyway,
so this will probably be v5.5 material.

Thanks,
    Paul

> ---
>  arch/mips/Kbuild.platforms                    |   1 +
>  arch/mips/Kconfig                             |  51 +++++--
>  arch/mips/include/asm/bootinfo.h              |   1 -
>  .../mach-loongson2ef/cpu-feature-overrides.h  |  45 +++++++
>  .../cs5536/cs5536.h                           |   0
>  .../cs5536/cs5536_mfgpt.h                     |   0
>  .../cs5536/cs5536_pci.h                       |   0
>  .../cs5536/cs5536_vsm.h                       |   0
>  .../loongson2ef.h}                            |  29 +---
>  .../machine.h                                 |   6 -
>  .../mc146818rtc.h                             |   5 +-
>  .../mem.h                                     |   6 +-
>  arch/mips/include/asm/mach-loongson2ef/pci.h  |  43 ++++++
>  .../include/asm/mach-loongson2ef/spaces.h     |  10 ++
>  .../mach-loongson64/cpu-feature-overrides.h   |   8 +-
>  arch/mips/include/asm/mach-loongson64/irq.h   |   7 +-
>  .../asm/mach-loongson64/kernel-entry-init.h   |  74 ----------
>  .../include/asm/mach-loongson64/loongson64.h  |  48 +++++++
>  .../mips/include/asm/mach-loongson64/mmzone.h |  16 ---
>  arch/mips/include/asm/mach-loongson64/pci.h   |  41 +-----
>  .../include/asm/mach-loongson64/workarounds.h |   4 +-
>  arch/mips/loongson2ef/Kconfig                 |  93 +++++++++++++
>  arch/mips/loongson2ef/Makefile                |  18 +++
>  arch/mips/loongson2ef/Platform                |  32 +++++
>  .../common/Makefile                           |   0
>  .../common/bonito-irq.c                       |   2 +-
>  .../common/cmdline.c                          |   2 +-
>  .../common/cs5536/Makefile                    |   0
>  .../common/cs5536/cs5536_acc.c                |   0
>  .../common/cs5536/cs5536_ehci.c               |   0
>  .../common/cs5536/cs5536_ide.c                |   0
>  .../common/cs5536/cs5536_isa.c                |   0
>  .../common/cs5536/cs5536_mfgpt.c              |   0
>  .../common/cs5536/cs5536_ohci.c               |   0
>  .../common/cs5536/cs5536_pci.c                |   0
>  .../common/early_printk.c                     |   2 +-
>  arch/mips/loongson2ef/common/env.c            |  71 ++++++++++
>  .../{loongson64 =3D> loongson2ef}/common/init.c |   7 +-
>  .../{loongson64 =3D> loongson2ef}/common/irq.c  |   2 +-
>  .../common/machtype.c                         |   3 +-
>  .../{loongson64 =3D> loongson2ef}/common/mem.c  |  40 +-----
>  .../{loongson64 =3D> loongson2ef}/common/pci.c  |  11 +-
>  .../common/platform.c                         |   0
>  .../{loongson64 =3D> loongson2ef}/common/pm.c   |   2 +-
>  .../common/reset.c                            |  23 +---
>  .../{loongson64 =3D> loongson2ef}/common/rtc.c  |   0
>  .../common/serial.c                           |  37 +----
>  .../common/setup.c                            |   2 +-
>  .../{loongson64 =3D> loongson2ef}/common/time.c |   2 +-
>  .../common/uart_base.c                        |  10 +-
>  .../fuloong-2e/Makefile                       |   0
>  .../fuloong-2e/dma.c                          |   0
>  .../fuloong-2e/irq.c                          |   2 +-
>  .../fuloong-2e/reset.c                        |   2 +-
>  .../lemote-2f/Makefile                        |   0
>  .../lemote-2f/clock.c                         |   2 +-
>  .../lemote-2f/dma.c                           |   0
>  .../lemote-2f/ec_kb3310b.c                    |   0
>  .../lemote-2f/ec_kb3310b.h                    |   0
>  .../lemote-2f/irq.c                           |   2 +-
>  .../lemote-2f/machtype.c                      |   2 +-
>  .../lemote-2f/pm.c                            |   2 +-
>  .../lemote-2f/reset.c                         |   2 +-
>  arch/mips/loongson64/Kconfig                  | 126 +-----------------
>  arch/mips/loongson64/Makefile                 |  23 +---
>  arch/mips/loongson64/Platform                 |  26 +---
>  .../loongson64/{loongson-3 =3D> }/acpi_init.c   |   3 +-
>  .../loongson64/{loongson-3 =3D> }/cop2-ex.c     |   5 +-
>  arch/mips/loongson64/{loongson-3 =3D> }/dma.c   |   6 +-
>  arch/mips/loongson64/{common =3D> }/env.c       |  72 +++-------
>  arch/mips/loongson64/{loongson-3 =3D> }/hpet.c  |   0
>  arch/mips/loongson64/{loongson-3 =3D> }/irq.c   |  40 +++++-
>  arch/mips/loongson64/loongson-3/Makefile      |  11 --
>  arch/mips/loongson64/{loongson-3 =3D> }/numa.c  |   4 +-
>  arch/mips/loongson64/pci.c                    |  45 +++++++
>  .../loongson64/{loongson-3 =3D> }/platform.c    |   0
>  arch/mips/loongson64/reset.c                  |  58 ++++++++
>  arch/mips/loongson64/setup.c                  |  91 +++++++++++++
>  arch/mips/loongson64/{loongson-3 =3D> }/smp.c   |   4 +-
>  arch/mips/loongson64/{loongson-3 =3D> }/smp.h   |   0
>  arch/mips/oprofile/op_model_loongson2.c       |   2 +-
>  arch/mips/oprofile/op_model_loongson3.c       |   2 +-
>  arch/mips/pci/Makefile                        |   2 +-
>  arch/mips/pci/fixup-fuloong2e.c               |   2 +-
>  arch/mips/pci/fixup-lemote2f.c                |   2 +-
>  arch/mips/pci/ops-loongson2.c                 |   2 +-
>  arch/mips/pci/ops-loongson3.c                 |   2 +-
>  drivers/cpufreq/loongson2_cpufreq.c           |   2 +-
>  drivers/gpio/gpio-loongson.c                  |   2 +-
>  drivers/platform/mips/cpu_hwmon.c             |   2 +-
>  90 files changed, 720 insertions(+), 582 deletions(-)
>  create mode 100644 arch/mips/include/asm/mach-loongson2ef/cpu-feature-ov=
errides.h
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536_mfgpt.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536_pci.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/cs5=
536/cs5536_vsm.h (100%)
>  rename arch/mips/include/asm/{mach-loongson64/loongson.h =3D> mach-loong=
son2ef/loongson2ef.h} (91%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/mac=
hine.h (80%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/mc1=
46818rtc.h (80%)
>  rename arch/mips/include/asm/{mach-loongson64 =3D> mach-loongson2ef}/mem=
.h (86%)
>  create mode 100644 arch/mips/include/asm/mach-loongson2ef/pci.h
>  create mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
>  delete mode 100644 arch/mips/include/asm/mach-loongson64/kernel-entry-in=
it.h
>  create mode 100644 arch/mips/include/asm/mach-loongson64/loongson64.h
>  create mode 100644 arch/mips/loongson2ef/Kconfig
>  create mode 100644 arch/mips/loongson2ef/Makefile
>  create mode 100644 arch/mips/loongson2ef/Platform
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/Makefile (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/bonito-irq.c (97%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cmdline.c (97%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/Makefile (1=
00%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_acc.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ehci=
.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ide.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_isa.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_mfgp=
t.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_ohci=
.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/cs5536/cs5536_pci.=
c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/early_printk.c (97=
%)
>  create mode 100644 arch/mips/loongson2ef/common/env.c
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/init.c (90%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/irq.c (98%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/machtype.c (94%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/mem.c (72%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/pci.c (89%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/platform.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/pm.c (99%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/reset.c (77%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/rtc.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/serial.c (63%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/setup.c (97%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/time.c (96%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/common/uart_base.c (77%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/Makefile (100%=
)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/dma.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/irq.c (98%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/fuloong-2e/reset.c (93%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/Makefile (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/clock.c (98%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/dma.c (100%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/ec_kb3310b.c (1=
00%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/ec_kb3310b.h (1=
00%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/irq.c (99%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/machtype.c (98%=
)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/pm.c (99%)
>  rename arch/mips/{loongson64 =3D> loongson2ef}/lemote-2f/reset.c (99%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/acpi_init.c (99%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/cop2-ex.c (88%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/dma.c (82%)
>  rename arch/mips/loongson64/{common =3D> }/env.c (79%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/hpet.c (100%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/irq.c (77%)
>  delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
>  rename arch/mips/loongson64/{loongson-3 =3D> }/numa.c (98%)
>  create mode 100644 arch/mips/loongson64/pci.c
>  rename arch/mips/loongson64/{loongson-3 =3D> }/platform.c (100%)
>  create mode 100644 arch/mips/loongson64/reset.c
>  create mode 100644 arch/mips/loongson64/setup.c
>  rename arch/mips/loongson64/{loongson-3 =3D> }/smp.c (99%)
>  rename arch/mips/loongson64/{loongson-3 =3D> }/smp.h (100%)
