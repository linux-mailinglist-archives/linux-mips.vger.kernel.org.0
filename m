Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15A08221C9
	for <lists+linux-mips@lfdr.de>; Sat, 18 May 2019 08:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfERGb4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 May 2019 02:31:56 -0400
Received: from mail-eopbgr780137.outbound.protection.outlook.com ([40.107.78.137]:6848
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbfERGb4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 18 May 2019 02:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31LfEHucMieoC0OH0HUuvXG51l8jSbOQYpPN7arvVgI=;
 b=czzaqIKPqmz7C8itPuNjE0ZdG5uy6h4BfvsIjGKjJfRRr1qu889/G7ZX9FJeXki56TKd2PrPfbVfDGnKFlGF/11CXxMHAh9Kx7ojGnMmuveTova7GPhhMejDuc+rtZPNozRS89SZiprp+D7YIG1A676GMdx8JFg6OKCC4Pjmgms=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1488.namprd22.prod.outlook.com (10.174.170.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Sat, 18 May 2019 06:31:52 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1900.010; Sat, 18 May 2019
 06:31:51 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: [GIT PULL] More MIPS changes for 5.2
Thread-Topic: [GIT PULL] More MIPS changes for 5.2
Thread-Index: AQHVDUNg37AV/Y+AA0CHXsgmhVUIIQ==
Date:   Sat, 18 May 2019 06:31:51 +0000
Message-ID: <20190518063149.pvcmpgulqnwwuwuf@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:a03:54::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8673adf1-9ee6-4793-14e8-08d6db5a8300
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(49563074)(7193020);SRVR:MWHPR2201MB1488;
x-ms-traffictypediagnostic: MWHPR2201MB1488:
x-microsoft-antispam-prvs: <MWHPR2201MB148838F7F904C33A7D8AD867C1040@MWHPR2201MB1488.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0041D46242
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(396003)(366004)(376002)(39850400004)(346002)(136003)(189003)(199004)(9686003)(7736002)(305945005)(316002)(2906002)(25786009)(99936001)(33716001)(6116002)(1076003)(102836004)(52116002)(6916009)(99286004)(386003)(6506007)(6512007)(256004)(14444005)(3716004)(58126008)(8676002)(54906003)(81166006)(81156014)(71190400001)(71200400001)(66616009)(68736007)(8936002)(14454004)(478600001)(6436002)(42882007)(4326008)(5660300002)(46003)(64756008)(476003)(66946007)(44832011)(66476007)(66556008)(73956011)(6486002)(66446008)(186003)(53936002)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1488;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9idvyflQvSZ9h0HAG5ctU0AXOctqHpQhv+J9vBkt/J7MAPSaGoFMj3Ui2FNak1bB/Rczyx60p2ysVerFoZu1U6OSr9OmwbMFJwr0xB1e6I3nmI6R4sqcCVrUKgNu0r7rYLVYW8qKTQ5G2SmdFEJqwPUfcbQ0wZXde+iYBaBrgnHLC+HnSre9WhwFRl8AV+DOwOoXD12FIMpHSO2ZqNfiiWi2SsWmE2X9Y2k2TjOuHqAkvuhlGX1vO8x1Y5DqTJYWFpP3Gd7cHE0meXWSU9SnApsBZPXm2xGQeDjF/FI0sHaf7XpuBgi0hePm1UHC0ESjJde1JDuNOcO9UXvST9GmaPpbwjiPz6okL1gfSBvvuwpoHOB+GSsoQ6ZfbJluF+1ntRbS9nlDogBsiKCBxNNnEUzEYPExmWjTtAVpzUjn0Os=
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ipltsq3rrhonmppt"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8673adf1-9ee6-4793-14e8-08d6db5a8300
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2019 06:31:51.7629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1488
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--ipltsq3rrhonmppt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here's a few more MIPS changes for 5.2, consisting of some SGI IP27
specific PCI rework and a batch of fixes. Please pull.

You'll see a conflict in arch/mips/sgi-ip27/ip27-irq.c due to commit
e4952b0c2c03 ("MIPS: SGI-IP27: Fix use of unchecked pointer in
shutdown_bridge_irq") which was merged in v5.1-rc5. The correct
resolution is to take the file content from the mips_5.2_2 tag, ie.
remove the startup_bridge_irq() & shutdown_bridge_irq() functions.

Thanks,
    Paul


The following changes since commit 3751cbda8f223549d7ea28803cbec8ac87e43ed2:

  mips: Manually call fdt_init_reserved_mem() method (2019-05-05 20:12:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_5.2_2

for you to fetch changes up to b1e479e3dcbc970bfc0b20a56f213e4df08daf75:

  MIPS: Alchemy: add DMA masks for on-chip ethernet (2019-05-15 14:29:29 -0700)

----------------------------------------------------------------
A few more MIPS changes for 5.2:

- A build fix for BMIPS5000 configurations with CONFIG_HW_PERF_EVENTS=y,
  which also neatly removes some #ifdefery.

- A fix to report supported ISAs correctly on older Ingenic SoCs which
  incorrectly indicate MIPSr2 support in their cop0 Config register.

- Some PCI modernization for SGI IP27 systems as part of ongoing work to
  support some other SGI systems.

- A fix allowing use of appended DTB files with generic kernels.

- DMA mask fixes for SGI IP22 & Alchemy systems.

----------------------------------------------------------------
Florian Fainelli (1):
      MIPS: perf: Fix build with CONFIG_CPU_BMIPS5000 enabled

Manuel Lauss (1):
      MIPS: Alchemy: add DMA masks for on-chip ethernet

Marcin Nowakowski (1):
      generic: fix appended dtb support

Paul Cercueil (1):
      MIPS: Fix Ingenic SoCs sometimes reporting wrong ISA

Thomas Bogendoerfer (3):
      MIPS: SGI-IP27: use generic PCI driver
      MIPS: SGI-IP27: abstract chipset irq from bridge
      MIPS: SGI-IP22: provide missing dma_mask/coherent_dma_mask

 arch/mips/Kconfig                          |   6 +
 arch/mips/alchemy/common/platform.c        |  22 +-
 arch/mips/generic/init.c                   |   4 +-
 arch/mips/include/asm/mach-ip27/topology.h |  11 +-
 arch/mips/include/asm/pci/bridge.h         |  14 +-
 arch/mips/include/asm/sn/irq_alloc.h       |  11 +
 arch/mips/include/asm/xtalk/xtalk.h        |   9 -
 arch/mips/kernel/cpu-probe.c               |   8 +
 arch/mips/kernel/perf_event_mipsxx.c       |  21 +-
 arch/mips/pci/Makefile                     |   3 +-
 arch/mips/pci/ops-bridge.c                 | 302 --------------
 arch/mips/pci/pci-ip27.c                   | 181 ---------
 arch/mips/pci/pci-xtalk-bridge.c           | 610 +++++++++++++++++++++++++++++
 arch/mips/sgi-ip22/ip22-platform.c         |  13 +
 arch/mips/sgi-ip27/ip27-init.c             |   2 +
 arch/mips/sgi-ip27/ip27-irq.c              | 191 ++++-----
 arch/mips/sgi-ip27/ip27-xtalk.c            |  61 ++-
 include/linux/platform_data/xtalk-bridge.h |  22 ++
 18 files changed, 831 insertions(+), 660 deletions(-)
 create mode 100644 arch/mips/include/asm/sn/irq_alloc.h
 delete mode 100644 arch/mips/pci/ops-bridge.c
 create mode 100644 arch/mips/pci/pci-xtalk-bridge.c
 create mode 100644 include/linux/platform_data/xtalk-bridge.h

--ipltsq3rrhonmppt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXN+m1QAKCRA+p5+stXUA
3RKHAP42Xxe+rzIHg9zrsOalB7XVi2H1wZu9sNakQYB/6PPb8wEAn1iuoaQJsvEH
e01qEM2t6lEp1tw+YOb1lnS/T7Wz7Ac=
=Y7hu
-----END PGP SIGNATURE-----

--ipltsq3rrhonmppt--
