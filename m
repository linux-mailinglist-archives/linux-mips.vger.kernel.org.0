Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1876BF16
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2019 17:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfGQP0D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jul 2019 11:26:03 -0400
Received: from mail-eopbgr820137.outbound.protection.outlook.com ([40.107.82.137]:55188
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728759AbfGQP0D (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Jul 2019 11:26:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPhTEqckSiA4KeOAd9GkGVG8D4TrbTk3bvc6haIyeuAINTSYRaU154CjtSxxEwD3P0V2G1eiWo2HJXpS7/H5PBmfjoewzMbpUPkGFvw11hdnpjn1chcGgSkOeKa0F8coI72mI8Hla0QyatIMNWvBJ+p62q/frFEfCZoPY4n/hVMuKyKqkfzVM4pICfPd/0FjtBSu/Nwk3VtHC3Yv9oqts9MlfWytQ4DzOxeQyMvFdllSXE4vPMmm1O7Ts39ZEABJ8XpXg63a0VY1ckMXH76zzaXcXO9NqZMpbfRVJOpam7vXLk5gIMdaNqzP0fHa4PWj6o0id5eC97p1XKim+9iq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhgbgFepwYCRsjrYk5MwwCLMp2kif6NyROU5ritNqnY=;
 b=hEGNeHjCBJTpfn8We7pQ6Ze1eRATOupoCJ/b+kh9ZSn75Q2HBkzglPMqMBJ/8OE2sGsLWY3GAHsmnwqzHxeuNmodiN+yS2IzRqJDutg6OuOzUov1RXhBXvhjyM2XuvchP4d1ujd/O/dEA8q3Drj8afWo0fz5Jbvyje2wr3P8Jnbf7/X0X0vD2GxcYoAwSHYCSXxKGMFVsCnqRQezP5YNpzwGaEqBT+wnUbPauZOSbqP4C+NnlUg7+X9D3JG+GcTRyehadjHDFXVaYyWAzp12bJ/SARojvc8cbgRRZ5dCTGbRsDaqiFjOOkhvYa/pyO0MiiF84YMrnI6k9otTJ4Spxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhgbgFepwYCRsjrYk5MwwCLMp2kif6NyROU5ritNqnY=;
 b=CvFLtIDp8CqlnhKmDBHPpri/T0q0DwCT5DioypQPsfXIgWi3U0tKdElQdcl7bJPzDBfGjZu5pOvBzUO7/ceq+D4ZTffpQW/Fl+VvMHQEY97315E85XEGhEXUhHOzBuekZr1Kw9Smegi4ZWvnh7zz0JHogopOrgtSoKVY4AMEeO4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1263.namprd22.prod.outlook.com (10.172.62.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 15:25:47 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 15:25:47 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: [GIT PULL] MIPS changes
Thread-Topic: [GIT PULL] MIPS changes
Thread-Index: AQHVPLPoK/14/ZdPr0q996RBCFXGJg==
Date:   Wed, 17 Jul 2019 15:25:47 +0000
Message-ID: <20190717152545.bhdnhjdf2tlhuv3o@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0086.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc5c98bc-4920-4550-f51c-08d70acb0acf
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1263;
x-ms-traffictypediagnostic: MWHPR2201MB1263:
x-microsoft-antispam-prvs: <MWHPR2201MB126362A62B51D6FE0F6A35CFC1C90@MWHPR2201MB1263.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(376002)(366004)(136003)(346002)(39840400004)(396003)(189003)(52314003)(199004)(6116002)(6512007)(9686003)(53936002)(3846002)(8676002)(6486002)(7736002)(305945005)(71190400001)(33716001)(478600001)(6916009)(44832011)(68736007)(6436002)(66066001)(2906002)(486006)(256004)(8936002)(54906003)(386003)(58126008)(6506007)(81166006)(1076003)(66946007)(476003)(81156014)(66476007)(64756008)(102836004)(71200400001)(26005)(66556008)(66446008)(99286004)(25786009)(186003)(5660300002)(4326008)(42882007)(52116002)(316002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1263;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WPwzMlWJ/vSId7HvUuuSuSWKZbp13reNiLAjpdH+tIKztj/S5P4UDu4ljVWx2KVIVrdDvNIn8E0wD6CzkBK6yhgBtvgwdBu6thb95Yz8gw9sh6Xlg+naiNX2hnI6/S+SLnBzrTXT8L6t6ncgXY3j9ppybjdGxheUCA8rU+pNY80WfRAcc0tMCVfskjtL7KQIPddOxdJ51jpoNxi1h6ChQHxSjSE2pAPsynv2W5DaIbC8lHiUYNtJChq3LA6uKDjXOdlqSnVPanQRjSbKuv1+HzmfGXKok5lyE/MOQUeGMZRst0JLddpENNjTI9oSJ7eQsP1ABcrFdFZ2SySGUIbTHa8Ebts9ncxbQIZOUJmiRwaJo4AwAlkEiYlx2pshgkg4TAhuXTFJXwvWeRtALZwuwevrVLs8w8QTjCFbnDfoiNM=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F7AB5C2587A1E64886ADA5EE0437EB13@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5c98bc-4920-4550-f51c-08d70acb0acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 15:25:47.4395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1263
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Linus,

Here are the main MIPS changes for v5.3, a light batch this time around
but significant improvements for certain systems. Please pull.

There's one minor conflict in arch/mips/include/asm/mach-ralink/pinmux.h
when merging with current master. Commit 1d0ea0692ae3 ("treewide:
Replace GPLv2 boilerplate/reference with SPDX - rule 332") in master &
commit 017105478bb5 ("MIPS: ralink: Switch pinmux.h to SPDX header")
from the MIPS tree both add the SPDX header but a little differently in
terms of comment style & license name. Reading
Documentation/process/license-rules.rst suggests to me that the version
in the MIPS tree is correct in terms of license name ("GPL-2.0" without
the "-only" suffix) whilst the version in master is correct in terms of
comment style ("/* */" rather than "//"). That would make the correct
resolution something like this:

diff --cc arch/mips/include/asm/mach-ralink/pinmux.h
index e54d4e1533b4,33647f796140..06ff9b17e42e
--- a/arch/mips/include/asm/mach-ralink/pinmux.h
+++ b/arch/mips/include/asm/mach-ralink/pinmux.h
@@@ -1,6 -1,5 +1,5 @@@
- /* SPDX-License-Identifier: GPL-2.0-only */
 -// SPDX-License-Identifier: GPL-2.0
++/* SPDX-License-Identifier: GPL-2.0 */
  /*
-  *
   *  Copyright (C) 2012 John Crispin <john@phrozen.org>
   */
=20
Thanks,
    Paul


The following changes since commit cd6c84d8f0cdc911df435bb075ba22ce3c605b07=
:

  Linux 5.2-rc2 (2019-05-26 16:49:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.=
3

for you to fetch changes up to e5793cd1b5fedb39337cfa62251a25030f526e56:

  MIPS: fix some more fall through errors in arch/mips (2019-07-16 12:40:16=
 +0100)

----------------------------------------------------------------
The main MIPS changes for a pretty light v5.3 cycle, including:

- Removal of readq & writeq for MIPS32 kernels where they would simply
  BUG() anyway, allowing drivers or other code that #ifdefs on their
  presence to work properly.

- Improvements for Ingenic JZ4740 systems, including support for the
  external memory controller & pinmuxing fixes for qi_lb60/NanoNote
  systems.

- Improvements for Lantiq systems, in particular around SMP & IPIs.

- DT updates for ralink/MediaTek MT7628a systems to probe & configure a
  bunch more devices.

- Miscellaneous cleanups & build fixes.

----------------------------------------------------------------
Anshuman Khandual (1):
      mips/kprobes: Export kprobe_fault_handler()

Geert Uytterhoeven (2):
      memory: jz4780-nemc: Grammar s/the its/its/
      MIPS: ftrace: Reword prepare_ftrace_return() comment block

Krzysztof Kozlowski (2):
      MIPS: config: Remove left-over BACKLIGHT_LCD_SUPPORT
      MIPS: configs: Remove useless UEVENT_HELPER_PATH

Lubomir Rintel (1):
      MIPS: ralink: Switch pinmux.h to SPDX header

Masahiro Yamada (1):
      MIPS: replace MBIT_ULL() with BIT_ULL()

Paul Burton (1):
      FDDI: defza: Include linux/io-64-nonatomic-lo-hi.h

Paul Cercueil (6):
      MIPS: lb60: Fix pin mappings
      memory: Kconfig: Drop dependency on MACH_JZ4780 for jz4780
      dt-bindings: memory: jz4780: Add compatible string for JZ4740 SoC
      memory: jz4780_nemc: Add support for the JZ4740
      memory: jz4780-nemc: Reduce size of const array
      MAINTAINERS: Add myself as Ingenic SoCs maintainer

Petr Cvek (7):
      MIPS: lantiq: Move macro directly to iomem function
      MIPS: lantiq: Change variables to the same type as the source
      MIPS: lantiq: Fix attributes of of_device_id structure
      MIPS: lantiq: Remove unused macros
      MIPS: lantiq: Fix bitfield masking
      MIPS: lantiq: Shorten register names, remove unused macros
      MIPS: lantiq: Add SMP support for lantiq interrupt controller

Serge Semin (1):
      mips: Remove q-accessors from non-64bit platforms

Stefan Roese (6):
      MIPS: ralink: mt7628a.dtsi: Add SPDX GPL-2.0 license identifier
      MIPS: ralink: mt7628a.dtsi: Add pinmux DT node
      MIPS: ralink: mt7628a.dtsi: Add pinctrl DT properties to the UART nod=
es
      MIPS: ralink: mt7628a.dtsi: Add GPIO controller DT node
      MIPS: ralink: mt7628a.dtsi: Add SPI controller DT node
      MIPS: ralink: mt7628a.dtsi: Add watchdog controller DT node

Stephen Rothwell (2):
      MIPS: perf events: handle switch statement falling through warnings
      MIPS: fix some more fall through errors in arch/mips

 .../memory-controllers/ingenic,jz4780-nemc.txt     |   1 +
 MAINTAINERS                                        |  27 ++++
 arch/mips/ar7/setup.c                              |   1 +
 arch/mips/ath79/setup.c                            |   2 +-
 arch/mips/bcm63xx/dev-flash.c                      |   1 +
 arch/mips/boot/dts/ralink/mt7628a.dtsi             | 148 ++++++++++++++++-
 arch/mips/cavium-octeon/executive/cvmx-pko.c       |   2 +-
 arch/mips/configs/ar7_defconfig                    |   1 -
 arch/mips/configs/ath25_defconfig                  |   1 -
 arch/mips/configs/ath79_defconfig                  |   1 -
 arch/mips/configs/bcm63xx_defconfig                |   1 -
 arch/mips/configs/bigsur_defconfig                 |   1 -
 arch/mips/configs/bmips_be_defconfig               |   1 -
 arch/mips/configs/bmips_stb_defconfig              |   1 -
 arch/mips/configs/cavium_octeon_defconfig          |   1 -
 arch/mips/configs/ci20_defconfig                   |   1 -
 arch/mips/configs/cobalt_defconfig                 |   1 -
 arch/mips/configs/fuloong2e_defconfig              |   1 -
 arch/mips/configs/gpr_defconfig                    |   1 -
 arch/mips/configs/ip27_defconfig                   |   1 -
 arch/mips/configs/ip32_defconfig                   |   1 -
 arch/mips/configs/lemote2f_defconfig               |   2 -
 arch/mips/configs/loongson1b_defconfig             |   1 -
 arch/mips/configs/loongson1c_defconfig             |   1 -
 arch/mips/configs/loongson3_defconfig              |   1 -
 arch/mips/configs/malta_defconfig                  |   1 -
 arch/mips/configs/malta_kvm_defconfig              |   1 -
 arch/mips/configs/malta_kvm_guest_defconfig        |   1 -
 arch/mips/configs/maltaup_xpa_defconfig            |   1 -
 arch/mips/configs/mips_paravirt_defconfig          |   1 -
 arch/mips/configs/omega2p_defconfig                |   1 -
 arch/mips/configs/pistachio_defconfig              |   1 -
 arch/mips/configs/pnx8335_stb225_defconfig         |   1 -
 arch/mips/configs/qi_lb60_defconfig                |   2 -
 arch/mips/configs/rb532_defconfig                  |   1 -
 arch/mips/configs/rt305x_defconfig                 |   1 -
 arch/mips/configs/sb1250_swarm_defconfig           |   1 -
 arch/mips/configs/tb0219_defconfig                 |   1 -
 arch/mips/configs/tb0226_defconfig                 |   1 -
 arch/mips/configs/tb0287_defconfig                 |   1 -
 arch/mips/configs/vocore2_defconfig                |   1 -
 arch/mips/configs/xway_defconfig                   |   1 -
 arch/mips/include/asm/cpu.h                        | 125 +++++++--------
 arch/mips/include/asm/io.h                         |  11 ++
 arch/mips/include/asm/kprobes.h                    |   1 +
 arch/mips/include/asm/mach-ralink/pinmux.h         |   5 +-
 arch/mips/jz4740/board-qi_lb60.c                   |  16 +-
 arch/mips/kernel/ftrace.c                          |  23 +--
 arch/mips/kernel/kprobes.c                         |   2 +-
 arch/mips/kernel/perf_event_mipsxx.c               |  30 ++--
 arch/mips/lantiq/irq.c                             | 177 +++++++++++++++--=
----
 drivers/memory/Kconfig                             |   2 +-
 drivers/memory/jz4780-nemc.c                       |  28 +++-
 drivers/net/fddi/defza.c                           |   1 +
 54 files changed, 439 insertions(+), 201 deletions(-)
