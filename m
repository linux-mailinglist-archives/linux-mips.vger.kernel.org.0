Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D571816D
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 23:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfEHVEw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 May 2019 17:04:52 -0400
Received: from mail-eopbgr790115.outbound.protection.outlook.com ([40.107.79.115]:22260
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726583AbfEHVEv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 May 2019 17:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVOFebMqLbEcTZf1m/KfUjdY4dV1Hiof/fZb+AMTMsE=;
 b=UKKA8+3IPKtFjtjxuT59hSlpIMBuKPyBZzsrMCYc0JWkYDga4M1WnmB46h4j6a1UOEXiGlzAoC+692OXBuKVDTyk8Y+l/ad36SRDJw68OQwFpRWLDmZ9Cjhljoc+eYnnUkOGQZsZmaCgwJ9LjjHKONDW7gTDJtIpbW832S0uF5Q=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1134.namprd22.prod.outlook.com (10.174.170.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 21:04:46 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 21:04:46 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MIPS changes for 5.2
Thread-Topic: [GIT PULL] MIPS changes for 5.2
Thread-Index: AQHVBeGqoPyJ4GYfbUyU2z9dy+Mklw==
Date:   Wed, 8 May 2019 21:04:46 +0000
Message-ID: <20190508210444.vxnmbd2sdluubjdy@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 326b4c44-8f7b-4c7a-c8dd-08d6d3f8ccbe
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(49563074)(7193020);SRVR:MWHPR2201MB1134;
x-ms-traffictypediagnostic: MWHPR2201MB1134:
x-microsoft-antispam-prvs: <MWHPR2201MB1134CD772C32BBB41876FBFCC1320@MWHPR2201MB1134.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(366004)(396003)(39850400004)(136003)(376002)(199004)(189003)(5660300002)(7736002)(66446008)(66556008)(66476007)(66616009)(256004)(305945005)(478600001)(4326008)(73956011)(66946007)(476003)(81156014)(316002)(186003)(486006)(99936001)(81166006)(8676002)(44832011)(64756008)(52116002)(6916009)(6436002)(99286004)(68736007)(14444005)(1076003)(42882007)(6486002)(66574012)(3846002)(6116002)(2906002)(9686003)(53936002)(26005)(6512007)(386003)(6506007)(8936002)(66066001)(102836004)(33716001)(25786009)(54906003)(58126008)(14454004)(71190400001)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1134;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V1uj8uZOqOMcVbL3mx8Omg912TctclzyU5YPCjaYICLQWzGA2CFWn0wkcXJ6h1THpnY61C9rjoQ3rM3QpUUOfu7Ksp7MXt2JQeJz5Hyg6QGUQLJyzqKz8Sz61/DllkrsS4+VRPHDUzzl6fx+bvi8jg7w+w0PsmxZSi/H/KrKV185/+hCw48xjpWXOS9NlNcaatNe/16ohMuX/64+PZmZBPMg4T3GrIqm6TuZLeI8X0BJ8bEZVsuxUDup4LexEcquC6sFqK49j8PeLY8t1fDmssl7+e/1mjvvBvFWVXQeJLYe+ouxEBDlYZ0egFeAu29waH1BnN4AGtXHqGY2u7gU+Nd1rkVawTtRLG4Mdu+Zr2eUHhkTz42SbkmpisjFSetRBgM0ePMZHXZRpXiqQZbNaJiMNxYIl/Xv28xiYhLUyWw=
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yiolb2m25wd3qrtj"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326b4c44-8f7b-4c7a-c8dd-08d6d3f8ccbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 21:04:46.5363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1134
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--yiolb2m25wd3qrtj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Here are the main MIPS changes for the 5.2 cycle.

I wound up merging in the mips_fixes_5.1_1 tag that you already merged
earlier in order to gain a fix for a jump label bug that would otherwise
have prevented me testing some work included here. I hope that's OK - it
does mean the shortlog below shows some changes that you already merged.

There are a few last minute changes which I hope to submit to you next
week if things seem calm enough, but that potential second pull request
will be even smaller than this one.

Please pull.

Thanks,
    Paul


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.2

for you to fetch changes up to 3751cbda8f223549d7ea28803cbec8ac87e43ed2:

  mips: Manually call fdt_init_reserved_mem() method (2019-05-05 20:12:20 -=
0700)

----------------------------------------------------------------
Main MIPS changes for v5.2:

- A set of memblock initialization improvements thanks to Serge Semin,
  tidying up after our conversion from bootmem to memblock back in
  v4.20.

- Our eBPF JIT the previously supported only MIPS64r2 through MIPS64r5
  is improved to also support MIPS64r6. Support for MIPS32 systems is
  introduced, with the caveat that it only works for programs that don't
  use 64 bit registers or operations - those will bail out & need to be
  interpreted.

- Improvements to the allocation & configuration of our exception vector
  that should fix issues seen on some platforms using recent versions of
  U-Boot.

- Some minor improvements to code generated for jump labels, along with
  enabling them by default for generic kernels.

----------------------------------------------------------------
Archer Yan (1):
      MIPS: Fix kernel crash for R6 in jump label branch function

Chuanhong Guo (1):
      MIPS: ralink: fix cpu clock of mt7621 and add dt clk devices

Enrico Weigelt, metux IT consult (1):
      arch: mips: Kconfig: pedantic formatting

Hassan Naveed (3):
      MIPS: uasm: Add div, mul and sel instructions for mipsr6
      MIPS: eBPF: Provide eBPF support for MIPS64R6
      MIPS: eBPF: Initial eBPF support for MIPS32 architecture.

Nick Desaulniers (1):
      mips: vdso: drop unnecessary cc-ldoption

Paul Burton (11):
      MIPS: Remove custom MIPS32 __kernel_fsid_t type
      MIPS: KVM: Use prandom_u32_max() to generate tlbwr index
      Merge tag 'mips_fixes_5.1_1' into mips-next
      MIPS: jump_label: Remove redundant nops
      MIPS: jump_label: Use compact branches for >=3D r6
      MIPS: generic: Enable CONFIG_JUMP_LABEL
      Revert "MIPS: ralink: fix cpu clock of mt7621 and add dt clk devices"
      MIPS: Use memblock_phys_alloc() for exception vector
      MIPS: Always allocate exception vector for MIPSr2+
      MIPS: Sync icache for whole exception vector
      MIPS: Remove duplicate EBase configuration

Petr =C5=A0tetiar (1):
      mips: bcm47xx: Enable USB power on Netgear WNDR3400v2

Serge Semin (11):
      mips: Make sure kernel .bss exists in boot mem pool
      mips: Discard rudiments from bootmem_init
      mips: Combine memblock init and memory reservation loops
      mips: Reserve memory for the kernel image resources
      mips: Discard post-CMA-init foreach loop
      mips: Use memblock to reserve the __nosave memory range
      mips: Add reserve-nomap memory type support
      mips: Dump memblock regions for debugging
      mips: Perform early low memory test
      mips: Make sure dt memory regions are valid
      mips: Manually call fdt_init_reserved_mem() method

Valentin Schneider (1):
      MIPS: entry: Remove unneeded need_resched() loop

Yasha Cherikovsky (1):
      MIPS: Ensure ELF appended dtb is relocated

Yifeng Li (1):
      mips: loongson64: lemote-2f: Add IRQF_NO_SUSPEND to "cascade" irqacti=
on.

 arch/mips/Kconfig                        |   64 +-
 arch/mips/bcm47xx/Kconfig                |    8 +-
 arch/mips/bcm47xx/workarounds.c          |    1 +
 arch/mips/bcm63xx/boards/Kconfig         |    2 +-
 arch/mips/configs/generic_defconfig      |    1 +
 arch/mips/include/asm/bootinfo.h         |    1 +
 arch/mips/include/asm/jump_label.h       |   17 +-
 arch/mips/include/asm/uasm.h             |    8 +
 arch/mips/include/uapi/asm/inst.h        |    6 +-
 arch/mips/include/uapi/asm/posix_types.h |    7 -
 arch/mips/kernel/entry.S                 |    5 +-
 arch/mips/kernel/jump_label.c            |   30 +-
 arch/mips/kernel/prom.c                  |   18 +-
 arch/mips/kernel/setup.c                 |  129 +--
 arch/mips/kernel/traps.c                 |   63 +-
 arch/mips/kernel/vmlinux.lds.S           |   12 +-
 arch/mips/kvm/emulate.c                  |    4 +-
 arch/mips/loongson64/lemote-2f/irq.c     |    2 +-
 arch/mips/mm/uasm-mips.c                 |   14 +
 arch/mips/mm/uasm.c                      |   39 +-
 arch/mips/net/Makefile                   |    1 -
 arch/mips/net/bpf_jit.c                  | 1270 --------------------------=
----
 arch/mips/net/bpf_jit_asm.S              |  285 -------
 arch/mips/net/ebpf_jit.c                 |  191 +++--
 arch/mips/pic32/Kconfig                  |    8 +-
 arch/mips/vdso/Makefile                  |    4 +-
 26 files changed, 351 insertions(+), 1839 deletions(-)
 delete mode 100644 arch/mips/net/bpf_jit.c
 delete mode 100644 arch/mips/net/bpf_jit_asm.S

--yiolb2m25wd3qrtj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXNNEbAAKCRA+p5+stXUA
3YLCAQDeKRTwxwsEcSI32YMmx7z9LGwP+uQs43n5niOLiAsy7AD+McVaVZq3k8dG
2M8WfBPv2LQOYaHHClYdhrXwC5jQfwU=
=Y4Nf
-----END PGP SIGNATURE-----

--yiolb2m25wd3qrtj--
