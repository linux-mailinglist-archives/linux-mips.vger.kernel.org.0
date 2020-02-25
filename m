Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A88F16BA29
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2020 07:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgBYG6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Feb 2020 01:58:39 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41088 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgBYG6j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Feb 2020 01:58:39 -0500
Received: by mail-pf1-f194.google.com with SMTP id j9so6665814pfa.8;
        Mon, 24 Feb 2020 22:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CzQ3KncUgYSz3MC9ExRBxLk8UvHns5L2mGX87wVc37U=;
        b=oggrB+In/wbOiqPZkuXluM1AP5HoUi58A/5YTr8Iql4s5G8a8b1Gv3LHbiJbUIXY9b
         kn74Npkl41OnHH7esNQWgS+Rx7OpVVmJF9J9MC1Z+H4h/J7/PFzC5S5x8akKjgAkCwy+
         HXKUqYaaiqx0pt9PagKJn7IFyXjzc58LBUsgLsWyIvjxKEcrnCwLKThnJ0Ilo7wEd7G8
         6jZ+4rOJ5WYDcr4+a+cSVmGBV5rdNhznedzOKgbqgDFAbdSyEzvjFR5BfDcB8h7+Gapc
         Lnd594VZlO8nGnn5dsPqZYNig+SD8hPbZDIQvM+SAiMkYV8h/m6vRmDOSXL3mv/yutS9
         cWvg==
X-Gm-Message-State: APjAAAVShsdHyOo1deact5kbSccUJcyGdQ+p2c3YhpIsBVc9SNfjf0Tt
        OZp56cfLEfKxErWdPLBJMpZ2p7PP44AHiw==
X-Google-Smtp-Source: APXvYqxzF43CzmsXLczZFZFmK9ilWsi6pnWsT7ryPEiBbjqzJXHPUUXVyL7qYZHpSUu8yV+hjhSrxQ==
X-Received: by 2002:a63:f454:: with SMTP id p20mr32313402pgk.149.1582613918078;
        Mon, 24 Feb 2020 22:58:38 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id g9sm15725491pfm.150.2020.02.24.22.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 22:58:37 -0800 (PST)
Date:   Mon, 24 Feb 2020 22:58:31 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes
Message-ID: <20200225065831.hl7ewk2s5trvhp4a@lantea.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y2bvbnogdcmp5lwj"
Content-Disposition: inline
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--y2bvbnogdcmp5lwj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Here are a few MIPS fixes, and a MAINTAINERS update to hand over MIPS
maintenance to Thomas Bogendoerfer - this will be my final pull request
as MIPS maintainer. Thanks for your helpful comments, useful corrections
& responsiveness during the time I've fulfilled the role, and I'm sure
I'll pop up elsewhere in the tree somewhere down the line. Anyway,
please pull.

Thanks,
    Paul


The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-fixes

for you to fetch changes up to 3234f4ed3066a58cd5ce8edcf752fa4fe0c95cb5:

  MAINTAINERS: Hand MIPS over to Thomas (2020-02-24 22:43:18 -0800)

----------------------------------------------------------------
Christophe JAILLET (1):
      MIPS: VPE: Fix a double free and a memory leak in 'release_vpe()'

Mark Tomlinson (1):
      MIPS: cavium_octeon: Fix syncw generation.

Nathan Chancellor (1):
      MIPS: vdso: Wrap -mexplicit-relocs in cc-option

Paul Burton (2):
      MIPS: Disable VDSO time functionality on microMIPS
      MAINTAINERS: Hand MIPS over to Thomas

Paul Cercueil (1):
      MIPS: ingenic: DTS: Fix watchdog nodes

Victor Kamensky (2):
      mips: vdso: fix 'jalr t9' crash in vdso code
      mips: vdso: add build time check that no 'jalr t9' calls left

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (1):
      MIPS: X1000: Fix clock of watchdog node.

 CREDITS                                |  5 +++++
 MAINTAINERS                            |  6 ++----
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 17 +++++++++--------
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 +++++++++--------
 arch/mips/boot/dts/ingenic/x1000.dtsi  |  6 ++----
 arch/mips/include/asm/sync.h           |  4 +++-
 arch/mips/kernel/vpe.c                 |  2 +-
 arch/mips/vdso/Makefile                | 28 +++++++++++++++++++++++++---
 8 files changed, 56 insertions(+), 29 deletions(-)

--y2bvbnogdcmp5lwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXlTFlwAKCRA+p5+stXUA
3TlOAP97o0+wz/dV5uhXiNBbCL2oaqzzUhEgvVnFOgnNQoGM9gD/UPjJUkYqx35H
UFE/GKQ+wGH3G7IQn9HWEivYmNfLdgk=
=wEA6
-----END PGP SIGNATURE-----

--y2bvbnogdcmp5lwj--
