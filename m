Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C017BA889D
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 21:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIDOTR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 10:19:17 -0400
Received: from mail-eopbgr680104.outbound.protection.outlook.com ([40.107.68.104]:35810
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729877AbfIDOTR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Sep 2019 10:19:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccJHbMOR93uQ+fondUV6zc47RxBbG9pPO9KW7LqiJOLxUyTD0x04kEvtlGxroa1/H9zLsxrfZ3mIfH4+HS2g92NQN4K3J27lSv0e0PwgYFXUq+bxHWl4bvY/HQDIq7j7ph7CtTQz6CtLkyKAuBRUlQgeY5dL0JCzJp/2GWUdE5Y0jLqRDf1nTaGoHi3+LnIJNqCA2dXqF/T6zlS27rdavk6Tg+lkpdMlkcnnbR9d94bWv/Veg1vto1QRDRiPVx7+NBOgaMu6hFqstq4oIjRaNxiuNKIWmUjXERh/tsnTskeRxHJAjxn1SXrqZAa5HAHROwWHKn9L48dcLZYb4tDQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKts4KBgjmCNdKxAB1ZFWvQVInrJlal16KksX24g6Oo=;
 b=lSHq+dJa+V04+bMxoYPhL5ZduPGTTW3BqfAGaLa97Hb1SAjGD9X/8nqYK3dV/bQ9kWJZH0P25q5K2bNSiFS7UUYHwFflHLPq18gVqlukxk8yBlkni8JLgb2HQE/+JwcgDUR0+wWQpZoTXSRYEJWT23cz0+8kU+0W7+SuZf6+M9R3/ey9wzqVPfeIHAk3jXQN3JngOZNACsU7sY4mNaKUqtYjvWT0MlFhtK/1ValtcOqNKvFPCXvdm59uVopz/C1x/AH4yavgMqvUobE9fUwqKgFHSEoNTJmEtUYzVihGFAkoXMsEWi6SBsbLJI2+Xc97RRRGq0/ORZ4bHu/lyvGyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKts4KBgjmCNdKxAB1ZFWvQVInrJlal16KksX24g6Oo=;
 b=iaZUbsn5/CCxLGkw1ahVVnfuRE4lCVHB0QMH3aUnQ86BkRVrLPnp/xreTE4v3H03kgnPJNrJwztRN+0qpIaqY1PNP2L7/M7jK+lRjJY3OH8qbGyr/Pta31t6tqCrCa8oPoMPXQRKdfKbcGF2QXa3b69SRaXirqEuwHJdpe+tR9k=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1216.namprd22.prod.outlook.com (10.174.161.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 4 Sep 2019 14:19:11 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.021; Wed, 4 Sep 2019
 14:19:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Fredrik Noring <noring@nocrew.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?iso-8859-1?Q?J=FCrgen_Urban?= <JuergenUrban@gmx.de>
Subject: Re: [PATCH 000/120] Linux for the PlayStation 2
Thread-Topic: [PATCH 000/120] Linux for the PlayStation 2
Thread-Index: AQHVYyu4w/pAdUa0306r+CnDKIYKVQ==
Date:   Wed, 4 Sep 2019 14:19:11 +0000
Message-ID: <20190904141026.hwzibvauis5sizq6@pburton-laptop>
References: <cover.1567326213.git.noring@nocrew.org>
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.196.178.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb743a90-f199-45ba-666a-08d73142daec
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1216;
x-ms-traffictypediagnostic: MWHPR2201MB1216:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB1216728E766BC76092F8CF4EC1B80@MWHPR2201MB1216.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(376002)(396003)(39840400004)(136003)(366004)(199004)(189003)(305945005)(186003)(42882007)(102836004)(229853002)(26005)(6486002)(6916009)(6506007)(55236004)(386003)(6306002)(9686003)(6512007)(76176011)(53936002)(53946003)(99286004)(4326008)(6246003)(52116002)(25786009)(58126008)(54906003)(316002)(66066001)(6436002)(33716001)(1076003)(30864003)(66946007)(5660300002)(66556008)(14454004)(64756008)(66446008)(478600001)(256004)(14444005)(66476007)(966005)(71190400001)(71200400001)(6116002)(3846002)(2906002)(81166006)(81156014)(8936002)(8676002)(476003)(7736002)(11346002)(446003)(486006)(44832011)(579004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1216;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0OUfyBLyMtnWW1638O4838gk6GLDjTztrdbzA/pmIr+NPCiq3ZfyZBuSsiW3lSKDMAvaOecWJPECJ+0Id2fTnhVA/JkEW9YRaIMN4Ajnx5PrXiDtPWYquU0uwi9YVdrRF49xPU0OwHtOKAcI6KFDmgkalyWewVEeqV2qzaKQ1HyvujhPVYi9RgBIkCowQPgzvQc9Xx1/NdJMO8AANq2kFOiFs0m7FxBE8UnWCC8BUj9WzGD++HLor5Cws39tLDVKQJBktaEHwmsay6f5q8wcvJUTpX/vaD4V3mXIW4G8G5qDOhkQLKFqwnLD+3BHUmk98ZVrsHZz3PsOuv4XlP1/D7Zm1L5NvVo118ehSpzgj/BqB4iuVb4jPs+ssQcptzmIZintI7iEi7rJQjIyGuasxQu4vatlSYGbb3MP7NBBRNU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <966DF1ADF43C6643931BDF3328C3ED6C@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb743a90-f199-45ba-666a-08d73142daec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 14:19:11.1520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpQ3AEeatenaNWu4YNE+Sfn1e/gm2Qb+B7FZMJBycXDpG38G+YJd8kDbUYSYE+rNQzAlxHIZ7CsnDNyNV5nrBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1216
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Fredrik,

On Sun, Sep 01, 2019 at 05:35:21PM +0200, Fredrik Noring wrote:
> Hi Paul,
>=20
> This is the initial patch submission for the PlayStation 2. The series
> implements support for USB devices and a frame buffer console, making
> Linux usable with unmodified hardware having a working boot loader
> installed on a memory card.

Wow - you've been busy, this patchset is huge!

> There are eight major parts:

I think we may be best to split this up into 8 (or more) different
patchsets along these lines. In my experience large patchsets that touch
lots of different subsystems are very difficult to get merged, so I'd
suggest maybe we start with just the CPU support for arch/mips/ & if you
have the bandwidth you could submit drivers to other subsystem
maintainers in parallel.

> 1. The R5900 is the main processor that runs the kernel[1]. It implements
>    the 64-bit MIPS III instruction set except LL, SC, LLD and SCD, with
>    additional PREFETCH and conditional move instructions from MIPS IV as
>    well as three-operand multiply and multiply-accumulate instructions.
>    It has a set of R5900 specific 128-bit multimedia instructions (MMIs).
>=20
>    The FPU implements single-precision floating-point operations but it
>    is not entirely IEEE 754 compatible. The FPU is therefore emulated in
>    software for normal ELF executables. The R5900 has several significant
>    hardware bugs. Perhaps the most important bug affecting applications
>    is the short loop bug that under certain conditions causes loops to
>    execute only once or twice.
>=20
>    R5900 specific handling of SYNC.P, SYNC.L, ERET, etc. are implemented.

I see you already got a few comments including on some of the early
CPU-related patches. I'll start looking through them in detail soon.

Thanks,
    Paul

> 2. Interrupts, a timer and minimal DMA support are implemented.
>=20
> 3. System commands (SCMDs) are implemented to identify the hardware model=
,
>    read and set the real-time clock (RTC), and power off the machine.
>=20
> 4. Read-only memory (ROM) operations are implemented. These are used to
>    identify the hardware. ROM operations are also used to resolve IOP
>    libraries linked as firmware, as explained below.
>=20
> 6. The input/output processor (IOP) and its sub-system interface (SIF)
>    are supported[2]. The IOP is a MIPS R3000A, or in later models a
>    PowerPC 405GP emulating a MIPS R3000A, sometimes referred to as the
>    sub processor. It runs a separate minikernel implemented in ROM. Most
>    peripherals require, in whole or in part, handling by the IOP.
>=20
>    Two IOP services are required to support USB devices: IOP memory
>    allocation and IOP interrupt relay. The latter requires linking a
>    custom IOP module, handled as firmware by the kernel, with library
>    dependency resolution. Remote procedure calls (RPCs) are used to
>    issue bidirectional commands over the SIF, via DMA.
>=20
> 7. The Graphics Synthesizer (GS) is the video hardware that displays the
>    frame buffer console. The GS is highly configurable with a substantial
>    set of hardware accelerated features. Its local memory is not directly
>    accessible from the main bus. All drawing primitives are transmitted
>    via DMA[3].
>=20
> 8. The frame buffer driver implements console support. The font is stored
>    as textures in local GS memory and several hardware accelerated
>    operations are implemented, for example XPAN, YPAN and YWRAP.
>=20
> The o32 ABI is supported, but not yet n32 as it involves some additional
> complications. I would very much like to add support for the 128-bit R590=
0
> GPRs, for two primary reasons:
>=20
> - The 128-bit multimedia instruction set is one of the defining features
>   of the R5900. A respectable PlayStation 2 application ought to use them=
.
>=20
> - The MMIs cannot be disabled by the kernel. MMIs will therefore appear
>   to mostly work, with some occasional register corruption due to context
>   switches, unless the kernel properly saves and restores the 128-bit
>   registers.
>=20
> This patch series has been tested with the PlayStation 2 models SCPH-3000=
4,
> SCPH-30004 R, SCPH-37000 L, SCPH-39004, SCPH-50004, SCPH-70004, SCPH-7500=
4
> and SCPH-77004.
>=20
> Please consider it for inclusion.
>=20
> Fredrik
>=20
> References:
>=20
> [1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
>     Toshiba Corporation, https://wiki.qemu.org/File:C790.pdf
>=20
> [2] "EE Overview", version 6.0, Sony Computer Entertainment Inc.
>=20
> [3] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.
>=20
> Fredrik Noring (120):
>   MIPS: R5900: Initial support for the Emotion Engine in the PlayStation =
2
>   MIPS: R5900: Trap the RDHWR instruction as an SQ address exception
>   MIPS: R5900: Sign-extend o32 system call registers
>   MIPS: R5900: Reset bits 127..64 of GPRs in RESTORE_SOME
>   MIPS: R5900: Reset the funnel shift amount (SA) register in RESTORE_SOM=
E
>   MIPS: R5900: Workaround for the short loop bug
>   MIPS: R5900: Add the SYNC.P instruction
>   MIPS: R5900: Add implicit SYNC.P to the UASM_i_M[FT]C0 macros
>   MIPS: R5900: Add mandatory SYNC.P to all M[FT]C0 instructions
>   MIPS: R5900: Workaround exception NOP execution bug (FLX05)
>   MIPS: R5900: Avoid pipeline hazard with the TLBP instruction
>   MIPS: R5900: Avoid pipeline hazards with the TLBW[IR] instructions
>   MIPS: R5900: Avoid pipeline hazard with the TLBR instruction
>   MIPS: R5900: Install final length of TLB refill handler rather than 256=
 bytes
>   MIPS: R5900: Verify that the TLB refill handler does not overflow
>   MIPS: R5900: The ERET instruction has issues with delay slot and CACHE
>   MIPS: R5900: Define CACHE instruction operation field encodings
>   MIPS: R5900: Workaround where MSB must be 0 for the instruction cache
>   MIPS: R5900: Use SYNC.L for data cache and SYNC.P for instruction cache
>   MIPS: R5900: Define CP0.Config register fields
>   MIPS: R5900: Workaround for CACHE instruction near branch delay slot
>   MIPS: R5900: Support 64-bit inq() and outq() macros in 32-bit kernels
>   MIPS: R5900: Add MFSA and MTSA instructions for the special SA register
>   MIPS: PS2: Define PlayStation 2 I/O port, ROM and RAM address spaces
>   MIPS: PS2: Define interrupt controller, DMA and timer IRQs
>   MIPS: PS2: Interrupt controller (INTC) IRQ support
>   MIPS: PS2: DMAC: Define DMA controller registers
>   MIPS: PS2: DMAC: Define tag structures
>   MIPS: PS2: DMAC: IRQ support
>   MIPS: PS2: Timer support
>   MIPS: PS2: SCMD: System command support
>   MIPS: PS2: SCMD: System power off command
>   MIPS: PS2: SCMD: Read system machine name command
>   MIPS: PS2: SCMD: Read system command for the real-time clock (RTC)
>   MIPS: PS2: SCMD: Set system command for the real-time clock (RTC)
>   MIPS: PS2: ROM: Iterate over the files in a given ROM directory
>   MIPS: PS2: ROM: Find ROM files with a given name, if they exist
>   MIPS: PS2: ROM: Read data for a given ROM file name
>   MIPS: PS2: ROM: Read extended information for a given ROM file
>   MIPS: PS2: ROM: Read and decode the ROMVER file
>   MIPS: PS2: ROM: Resolve the name for the type in the ROMVER file
>   MIPS: PS2: ROM: Resolve the name for the region in the ROMVER file
>   MIPS: PS2: ROM: Permit /dev/mem to access read-only memory
>   MIPS: PS2: ROM: Sysfs module to inspect ROM files
>   MIPS: PS2: ROM: Provide extended file information via sysfs
>   MIPS: PS2: Identify the machine by model name
>   MIPS: PS2: Let the system type be Sony PlayStation 2
>   MIPS: Define and use cpu_relax_forever() for various halting loops
>   MIPS: PS2: Power off support
>   MIPS: PS2: Real-time clock (RTC) driver
>   MIPS: PS2: IOP: I/O processor DMA register PCR2 set and clear
>   MIPS: PS2: SIF: Sub-system interface reset of the I/O processor (IOP)
>   MIPS: PS2: IOP: Define error numbers, descriptions and errno mapping
>   MIPS: PS2: SIF: SIF register write command support
>   MIPS: PS2: SIF: Respond to remote procedure call (RPC) bind command
>   MIPS: PS2: SIF: Respond to RPC bind end command
>   MIPS: PS2: SIF: Reset the SIF0 (sub-to-main) DMA controller
>   MIPS: PS2: SIF: Handle SIF0 (sub-to-main) RPCs via interrupts
>   MIPS: PS2: SIF: Enable the IOP to issue SIF commands
>   MIPS: PS2: SIF: Enable the IOP to issue SIF RPCs
>   MIPS: PS2: SIF: sif_rpc_bind() to request an RPC server connection
>   MIPS: PS2: SIF: sif_rpc_unbind() to release an RPC server connection
>   MIPS: PS2: SIF: sif_rpc() to issue a remote procedure call
>   MIPS: PS2: IOP: Permit /dev/mem to access IOP memory
>   MIPS: PS2: IOP: I/O processor memory support
>   FIXME: Export _dma_cache_{wback,wback_inv,inv}
>   MIPS: PS2: IOP: Module linking support
>   MIPS: PS2: IOP: Verify that modules are IRX objects
>   MIPS: PS2: IOP: Module version compatibility verification
>   MIPS: PS2: IOP: Avoid linking already linked library modules
>   MIPS: PS2: IOP: Resolve module dependencies
>   MIPS: PS2: IOP: SIF printk command support
>   MIPS: PS2: IOP: Heap memory allocate and free
>   MIPS: PS2: SIF: Request RPC IRQ command
>   MIPS: PS2: IOP: IRQ support
>   MIPS: PS2: GS: Define privileged Graphics Synthesizer registers
>   MIPS: PS2: GS: Write privileged registers
>   MIPS: PS2: GS: Read privileged registers
>   MIPS: PS2: GS: Define privileged register structures
>   MIPS: PS2: GS: Define gs_xorq_imr()
>   MIPS: PS2: GS: Privileged register write macros with named fields
>   MIPS: PS2: GS: IRQ support
>   MIPS: PS2: GS: Define Graphics Synthesizer primitive structures
>   MIPS: PS2: GIF: Define Graphics Synthesizer interface structures
>   MIPS: PS2: GIF: Graphics Synthesizer interface support
>   MIPS: PS2: GS: Graphics Synthesizer device init and video clock
>   MIPS: PS2: GS: Compute block count and indices
>   MIPS: PS2: GS: Primitive and texel coordinate transformations
>   MIPS: PS2: GS: Approximate video region with ROM region
>   macro: Extend COUNT_ARGS() from 12 to 32 arguments
>   MIPS: PS2: GS: Show privileged registers with sysfs
>   MIPS: PS2: GS: Store privileged registers with sysfs
>   fbdev: Add fb_warn_once() variant that only prints a warning once
>   MIPS: PS2: FB: Frame buffer driver for the PlayStation 2
>   MIPS: PS2: FB: fb_set_par() standard-definition television support
>   MIPS: PS2: FB: fb_set_par() high-definition television support
>   MIPS: PS2: FB: fb_set_par() VESA computer display mode support
>   MIPS: PS2: FB: Preconfigure standard PAL, NTSC and VESA display modes
>   MIPS: PS2: FB: Reset the Graphics Synthesizer drawing environment
>   MIPS: PS2: FB: Clear the display buffer when changing video modes
>   MIPS: PS2: FB: fb_setcolreg() 256 colour pseudo palette support
>   MIPS: PS2: FB: fb_settile() with font stored as palette indexed texture=
s
>   MIPS: PS2: FB: Hardware accelerated fb_tilecopy() support
>   MIPS: PS2: FB: Hardware accelerated fb_tilefill() support
>   MIPS: PS2: FB: Simplified fb_tileblit() support
>   MIPS: PS2: FB: fb_tilecursor() placeholder
>   MIPS: PS2: FB: Hardware accelerated fb_pan_display() support
>   MIPS: PS2: FB: fb_blank() display power management signaling (DPMS)
>   MIPS: PS2: FB: Disable GIF DMA completion interrupts
>   MIPS: PS2: FB: PAL and NTSC grayscale support
>   MIPS: PS2: FB: Analogue display mode adjustment module parameter
>   USB: OHCI: Support for the PlayStation 2
>   USB: OHCI: OHCI_INTR_MIE workaround for freeze on the PlayStation 2
>   MIPS: PS2: Workaround for unexpected uLaunchELF CP0 Status user mode
>   MIPS: PS2: Define initial PlayStation 2 devices
>   MIPS: PS2: Define workarounds related to the PlayStation 2
>   MIPS: PS2: Define R5900 feature overrides
>   MIPS: PS2: Define the PlayStation 2 platform
>   MIPS: PS2: Initial support for the Sony PlayStation 2
>   MIPS: Fix name of BOOT_MEM_ROM_DATA
>=20
>  arch/mips/Kbuild.platforms                    |    1 +
>  arch/mips/Kconfig                             |   35 +-
>  arch/mips/Makefile                            |    1 +
>  arch/mips/alchemy/board-gpr.c                 |    7 +-
>  arch/mips/alchemy/board-mtx1.c                |    7 +-
>  arch/mips/alchemy/board-xxs1500.c             |    7 +-
>  arch/mips/alchemy/devboards/platform.c        |    4 +-
>  arch/mips/ar7/setup.c                         |    4 +-
>  arch/mips/ath79/setup.c                       |    8 +-
>  arch/mips/bcm47xx/setup.c                     |    9 +-
>  arch/mips/bcm63xx/setup.c                     |   12 +-
>  arch/mips/boot/compressed/decompress.c        |    4 +-
>  arch/mips/boot/compressed/head.S              |   16 +-
>  arch/mips/cavium-octeon/smp.c                 |    4 +-
>  arch/mips/cobalt/reset.c                      |    5 +-
>  arch/mips/emma/markeins/setup.c               |    5 +-
>  arch/mips/fw/arc/init.c                       |    4 +-
>  arch/mips/include/asm/asmmacro.h              |   53 +
>  arch/mips/include/asm/cacheops.h              |   17 +
>  arch/mips/include/asm/cpu-type.h              |    4 +
>  arch/mips/include/asm/cpu.h                   |    3 +-
>  arch/mips/include/asm/io.h                    |   60 +-
>  arch/mips/include/asm/irqflags.h              |   15 +
>  .../asm/mach-ps2/cpu-feature-overrides.h      |   35 +
>  arch/mips/include/asm/mach-ps2/dmac.h         |  254 ++
>  arch/mips/include/asm/mach-ps2/gif.h          |   77 +
>  arch/mips/include/asm/mach-ps2/gs-registers.h |  646 +++++
>  arch/mips/include/asm/mach-ps2/gs.h           |   81 +
>  arch/mips/include/asm/mach-ps2/iop-error.h    |   76 +
>  arch/mips/include/asm/mach-ps2/iop-heap.h     |   19 +
>  arch/mips/include/asm/mach-ps2/iop-memory.h   |   21 +
>  arch/mips/include/asm/mach-ps2/iop-module.h   |   13 +
>  .../mips/include/asm/mach-ps2/iop-registers.h |   19 +
>  arch/mips/include/asm/mach-ps2/iop.h          |   21 +
>  arch/mips/include/asm/mach-ps2/irq.h          |  130 +
>  arch/mips/include/asm/mach-ps2/rom.h          |  171 ++
>  arch/mips/include/asm/mach-ps2/scmd.h         |   56 +
>  arch/mips/include/asm/mach-ps2/sif.h          |   94 +
>  arch/mips/include/asm/mach-ps2/war.h          |   24 +
>  arch/mips/include/asm/mipsregs.h              |  103 +
>  arch/mips/include/asm/module.h                |    2 +
>  arch/mips/include/asm/processor.h             |    6 +
>  arch/mips/include/asm/r4kcache.h              |  244 +-
>  arch/mips/include/asm/stackframe.h            |  108 +
>  arch/mips/include/asm/string.h                |    3 +
>  arch/mips/include/asm/traps.h                 |    2 +
>  arch/mips/include/asm/uasm.h                  |   23 +
>  arch/mips/include/uapi/asm/gif.h              |  164 ++
>  arch/mips/include/uapi/asm/gs.h               |  723 +++++
>  arch/mips/jz4740/reset.c                      |    9 +-
>  arch/mips/kernel/cpu-probe.c                  |    8 +
>  arch/mips/kernel/genex.S                      |   65 +
>  arch/mips/kernel/head.S                       |    9 +
>  arch/mips/kernel/r4k_switch.S                 |    9 +
>  arch/mips/kernel/scall32-o32.S                |   12 +
>  arch/mips/kernel/setup.c                      |    6 +-
>  arch/mips/kernel/traps.c                      |   19 +-
>  arch/mips/kernel/unaligned.c                  |   36 +-
>  arch/mips/lib/delay.c                         |    7 +-
>  arch/mips/lib/memset.S                        |    2 +
>  arch/mips/loongson64/common/reset.c           |   16 +-
>  arch/mips/mm/Makefile                         |    1 +
>  arch/mips/mm/c-r4k.c                          |   27 +-
>  arch/mips/mm/cache.c                          |    4 +
>  arch/mips/mm/cerr-sb1.c                       |    4 +-
>  arch/mips/mm/cex-gen.S                        |    6 +
>  arch/mips/mm/tlbex-fault.S                    |    3 +
>  arch/mips/mm/tlbex.c                          |   94 +-
>  arch/mips/mm/uasm-mips.c                      |    1 +
>  arch/mips/mm/uasm.c                           |    5 +-
>  arch/mips/pic32/common/reset.c                |    9 +-
>  arch/mips/pnx833x/common/reset.c              |    5 +-
>  arch/mips/ps2/Kconfig                         |   16 +
>  arch/mips/ps2/Makefile                        |   12 +
>  arch/mips/ps2/Platform                        |    7 +
>  arch/mips/ps2/devices.c                       |   98 +
>  arch/mips/ps2/dmac-irq.c                      |  102 +
>  arch/mips/ps2/identify.c                      |   86 +
>  arch/mips/ps2/intc-irq.c                      |  118 +
>  arch/mips/ps2/irq.c                           |   38 +
>  arch/mips/ps2/memory.c                        |   45 +
>  arch/mips/ps2/prom.c                          |   18 +
>  arch/mips/ps2/reboot.c                        |   29 +
>  arch/mips/ps2/rom-sysfs.c                     |  392 +++
>  arch/mips/ps2/rom.c                           |  702 +++++
>  arch/mips/ps2/scmd.c                          |  379 +++
>  arch/mips/ps2/time.c                          |  153 ++
>  arch/mips/sgi-ip22/ip22-reset.c               |    3 +-
>  arch/mips/sgi-ip27/ip27-berr.c                |    4 +-
>  arch/mips/sgi-ip27/ip27-reset.c               |   13 +-
>  arch/mips/sgi-ip32/ip32-berr.c                |    4 +-
>  arch/mips/sgi-ip32/ip32-irq.c                 |    3 +-
>  arch/mips/sibyte/common/cfe.c                 |    3 +-
>  arch/mips/txx9/rbtx4939/setup.c               |    4 +-
>  arch/mips/vr41xx/common/pmu.c                 |    2 +-
>  drivers/Makefile                              |    1 +
>  drivers/ps2/Makefile                          |   12 +
>  drivers/ps2/gif.c                             |  106 +
>  drivers/ps2/gs-irq.c                          |   93 +
>  drivers/ps2/gs-registers.c                    |  189 ++
>  drivers/ps2/gs-sysfs.c                        |  592 +++++
>  drivers/ps2/gs.c                              |  319 +++
>  drivers/ps2/iop-heap.c                        |   90 +
>  drivers/ps2/iop-irq.c                         |  186 ++
>  drivers/ps2/iop-memory.c                      |   56 +
>  drivers/ps2/iop-module.c                      |  954 +++++++
>  drivers/ps2/iop-registers.c                   |   39 +
>  drivers/ps2/sif.c                             |  888 +++++++
>  drivers/rtc/Kconfig                           |   10 +
>  drivers/rtc/Makefile                          |    1 +
>  drivers/rtc/rtc-ps2.c                         |   74 +
>  drivers/usb/host/Kconfig                      |    8 +
>  drivers/usb/host/Makefile                     |    1 +
>  drivers/usb/host/ohci-ps2.c                   |  264 ++
>  drivers/video/fbdev/Kconfig                   |   12 +
>  drivers/video/fbdev/Makefile                  |    1 +
>  drivers/video/fbdev/ps2fb.c                   | 2362 +++++++++++++++++
>  include/linux/console_struct.h                |    2 +
>  include/linux/fb.h                            |    2 +
>  include/linux/kernel.h                        |   12 +-
>  include/uapi/linux/fb.h                       |    1 +
>  121 files changed, 12077 insertions(+), 186 deletions(-)
>  create mode 100644 arch/mips/include/asm/mach-ps2/cpu-feature-overrides.=
h
>  create mode 100644 arch/mips/include/asm/mach-ps2/dmac.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/gif.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/gs-registers.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/gs.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/iop-error.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/iop-heap.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/iop-memory.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/iop-module.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/iop-registers.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/iop.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/irq.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/rom.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/scmd.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/sif.h
>  create mode 100644 arch/mips/include/asm/mach-ps2/war.h
>  create mode 100644 arch/mips/include/uapi/asm/gif.h
>  create mode 100644 arch/mips/include/uapi/asm/gs.h
>  create mode 100644 arch/mips/ps2/Kconfig
>  create mode 100644 arch/mips/ps2/Makefile
>  create mode 100644 arch/mips/ps2/Platform
>  create mode 100644 arch/mips/ps2/devices.c
>  create mode 100644 arch/mips/ps2/dmac-irq.c
>  create mode 100644 arch/mips/ps2/identify.c
>  create mode 100644 arch/mips/ps2/intc-irq.c
>  create mode 100644 arch/mips/ps2/irq.c
>  create mode 100644 arch/mips/ps2/memory.c
>  create mode 100644 arch/mips/ps2/prom.c
>  create mode 100644 arch/mips/ps2/reboot.c
>  create mode 100644 arch/mips/ps2/rom-sysfs.c
>  create mode 100644 arch/mips/ps2/rom.c
>  create mode 100644 arch/mips/ps2/scmd.c
>  create mode 100644 arch/mips/ps2/time.c
>  create mode 100644 drivers/ps2/Makefile
>  create mode 100644 drivers/ps2/gif.c
>  create mode 100644 drivers/ps2/gs-irq.c
>  create mode 100644 drivers/ps2/gs-registers.c
>  create mode 100644 drivers/ps2/gs-sysfs.c
>  create mode 100644 drivers/ps2/gs.c
>  create mode 100644 drivers/ps2/iop-heap.c
>  create mode 100644 drivers/ps2/iop-irq.c
>  create mode 100644 drivers/ps2/iop-memory.c
>  create mode 100644 drivers/ps2/iop-module.c
>  create mode 100644 drivers/ps2/iop-registers.c
>  create mode 100644 drivers/ps2/sif.c
>  create mode 100644 drivers/rtc/rtc-ps2.c
>  create mode 100644 drivers/usb/host/ohci-ps2.c
>  create mode 100644 drivers/video/fbdev/ps2fb.c
>=20
> --=20
> 2.21.0
>=20
