Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2678CC3E5
	for <lists+linux-mips@lfdr.de>; Fri,  4 Oct 2019 22:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfJDUGM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Oct 2019 16:06:12 -0400
Received: from mail-eopbgr710138.outbound.protection.outlook.com ([40.107.71.138]:31609
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727978AbfJDUGL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Oct 2019 16:06:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKQcfmsTIigocE/V+AY/75XWKX8RkrcrWzGBI/9TXh0yiqu7T9ucpQFppQDArXLVTOyU2hJTblrAUf5xQxRMAFkl8PKKZQYp0C2yjnw0mhVjhTVCVSE4MmBKsc5JWNFEIhakAqV0j0jVq8PRQwFS1wbH2W1Ox0EuGnVcntiLHqqluU3cbXPCAEatPaMkn77VQ/P0kbclVSAJychFfTFLzOLM10PW8TMATAmxwL+2G+gzrWq2C0QxII13xDNZoz7r3oUWUM3FoQD1KHTmT0uPgZyvZYdIdJn9g5AY7GXg8fkUaj25ifP3bvUZkSl+H/Nq04hGqUiEO/dv1lu32/IPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDUrR1yuxVXQzI9OGCetGTRT+Mfb2LxYeigou7U9xxI=;
 b=M+msJYWd7ZJsCeqCgTMTCGms/LEJbDnftGXcDdH1OkilZ3OLV4xh2vMTDTU1RgcxllipVIZeXKcdTsiVBDQhbPxjM2lpbC05iMC/BvS499n1dc7O70a+yEte8bVkrRQ9D7BcVjOylHtEOqgRzGb40hleRebIGdoJz/X435ORmkxCSUCOTpUPoyvNvA13CnymGu/ogzMOY3HUKftsGw+LlV3xLkSoFui/2OmEdxEVWNuhSbRD59x4k39f81lkiIIGBKwX0R7QdIMegczqDPlGUYumYy+POdmTCmDqGBguemj7rt0FnXBhB2Xbn9Dpv1uJ63fefjuMgzaoOY5EqHCuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDUrR1yuxVXQzI9OGCetGTRT+Mfb2LxYeigou7U9xxI=;
 b=j9zIfxgq+C2GMBszUic7jmhs7gUP8xTgT4sXulEJnm7kmPnVPqaJieyzES0I28zEjEKK8n5XyAATKeKBNlATjP+ZHt9uNYIUkOnQyuLsr6bf8q+FSfJVSnAOre2eJGc7rm5rlknBRV6pOZU2mlL4jTSDKVqq/fU7Go55I0tovjc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1647.namprd22.prod.outlook.com (10.174.167.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 20:05:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 20:05:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MIPS fixes
Thread-Topic: [GIT PULL] MIPS fixes
Thread-Index: AQHVeu8ROpr+ARU380KtMuRwpTpwlw==
Date:   Fri, 4 Oct 2019 20:05:28 +0000
Message-ID: <20191004200527.7ydsrszuqim6h645@pburton-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0036.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::49) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79093c86-f772-4eb6-047e-08d7490633f8
x-ms-traffictypediagnostic: MWHPR2201MB1647:
x-microsoft-antispam-prvs: <MWHPR2201MB164706B4A83370AA37219E25C19E0@MWHPR2201MB1647.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(376002)(346002)(39840400004)(396003)(366004)(189003)(199004)(64756008)(316002)(14454004)(1076003)(66446008)(99936001)(66556008)(66946007)(33716001)(25786009)(66476007)(66616009)(5660300002)(54906003)(44832011)(6916009)(478600001)(66066001)(81166006)(99286004)(8936002)(305945005)(7736002)(8676002)(81156014)(4326008)(6116002)(52116002)(486006)(6436002)(476003)(58126008)(102836004)(3846002)(71190400001)(71200400001)(26005)(42882007)(6486002)(386003)(6506007)(186003)(6512007)(256004)(9686003)(14444005)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1647;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GTU8VFPQwN04yiwcn0MpSAOcK9it+Y1Ws2i4T7Dd4XnIWS++DawlAUkeS13BxkjInI9KCANvZYWw+lW/y4GTbgNE7kCZmbhLTnDx0xrdLuoG4oYDPivQUX8BqhG0I6ry5dVl4kkpiit+fI+lLnCDgCv8dg2SYltejdoizwCbDCs64dIc+w07mXYmBg5OL2wHeY7K2pKpLm/FOzbZuypIegKnY+BQbgdDXGW8nzy3dNzbJnXfFT0af60dI0Vv+d+uVMcqOzNurtN333Xtu3xzOpVZRBjsmXm/dVyxC6dboCwANRfqZr1kEr7RbS64WDVaaZSJPRT2oETDxBVQbXx3DKZeBxp4pjA0yJJVUKMeW2AUuMa3DX0pDNv2WwNOEls7TLwMJ4NAxoEGcbIpct4km96lzZ+CAHivsLdAWGszhkk=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jpjyvsev7vx7ioyi"
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79093c86-f772-4eb6-047e-08d7490633f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 20:05:28.8657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nvGq93kXjhrF0/jb8SUi+l6TMD5Gk+A4x0HKXXZTMaTGWj0jUVMTOtL/pjEy9qmWjLzLf4KmRkw/d1SwnUIilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1647
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--jpjyvsev7vx7ioyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here is a selection of fixes for arch/mips, mostly handling regressions
introduced during the v5.4 merge window; please pull.

Thanks,
    Paul


The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.4_1

for you to fetch changes up to 6822c29ddbbdeafd8d1b79ebe6c51b83efd55ae1:

  MIPS: fw/arc: Remove unused addr variable (2019-10-04 11:46:22 -0700)

----------------------------------------------------------------
Some MIPS fixes for the 5.4 cycle:

- Build fixes for Cavium Octeon & PMC-Sierra MSP systems, as well as
  all pre-MIPSr6 configurations built with binutils < 2.25.

- Boot fixes for 64-bit Loongson systems & SGI IP28 systems.

- Wire up the new clone3 syscall.

- Clean ups for a few build-time warnings.

----------------------------------------------------------------
Christophe JAILLET (1):
      mips: Loongson: Fix the link time qualifier of 'serial_exit()'

Huacai Chen (1):
      MIPS: Loongson64: Fix boot failure after dropping boot_mem_map

Jiaxun Yang (1):
      MIPS: cpu-bugs64: Mark inline functions as __always_inline

Oleksij Rempel (1):
      MIPS: dts: ar9331: fix interrupt-controller size

Paul Burton (7):
      MIPS: octeon: Include required header; fix octeon ethernet build
      MIPS: Wire up clone3 syscall
      MIPS: VDSO: Remove unused gettimeofday.c
      MIPS: VDSO: Fix build for binutils < 2.25
      MIPS: pmcs-msp71xx: Add missing MAX_PROM_MEM definition
      MIPS: pmcs-msp71xx: Remove unused addr variable
      MIPS: fw/arc: Remove unused addr variable

Thomas Bogendoerfer (2):
      MIPS: init: Fix reservation of memory between PHYS_OFFSET and mem start
      MIPS: init: Prevent adding memory before PHYS_OFFSET

 arch/mips/boot/dts/qca/ar9331.dtsi        |   2 +-
 arch/mips/fw/arc/memory.c                 |   1 -
 arch/mips/include/asm/octeon/cvmx-ipd.h   |   1 +
 arch/mips/include/asm/unistd.h            |   1 +
 arch/mips/kernel/cpu-bugs64.c             |  14 +-
 arch/mips/kernel/setup.c                  |   5 +-
 arch/mips/kernel/syscall.c                |   1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl |   2 +-
 arch/mips/kernel/syscalls/syscall_n64.tbl |   2 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl |   2 +-
 arch/mips/loongson64/common/mem.c         |  35 ++--
 arch/mips/loongson64/common/serial.c      |   2 +-
 arch/mips/loongson64/loongson-3/numa.c    |  11 +-
 arch/mips/pmcs-msp71xx/msp_prom.c         |   4 +-
 arch/mips/vdso/Makefile                   |   2 +-
 arch/mips/vdso/gettimeofday.c             | 269 ------------------------------
 16 files changed, 41 insertions(+), 313 deletions(-)
 delete mode 100644 arch/mips/vdso/gettimeofday.c

--jpjyvsev7vx7ioyi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXZemBwAKCRA+p5+stXUA
3a+TAQCd6ndikkJ36LU9iRMdegakrRKxeK8AeDrNDYGPkGSY/AD/e5DuGeRCJJg5
X3mCgcPbCaQHZc8aeZPHxc9IMLC3qg8=
=h1cF
-----END PGP SIGNATURE-----

--jpjyvsev7vx7ioyi--
