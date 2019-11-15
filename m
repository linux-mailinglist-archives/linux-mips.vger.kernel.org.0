Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01312FD3E4
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2019 06:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfKOFE4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 00:04:56 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41972 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfKOFE4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Nov 2019 00:04:56 -0500
Received: by mail-pf1-f196.google.com with SMTP id p26so5823320pfq.8;
        Thu, 14 Nov 2019 21:04:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GE6hQGhTHyMhnZauws25uJSkPSE0gyI3eS4kkDg4LbY=;
        b=jwjQitG4mPk4I/rwoKlZTLvSKE8EYNuOR9HeBS3e6Yzlw2fSTLnVbhzI0JRTDK632W
         UAKFTNWm2xYX393OCvjSX7IjRtGPrX4nn2LmYwlD/U3qG8LDGjAXmckITVOTwsTIs4j5
         pd5lMpxNKuRQdLJtzMcTx8gon+3MINLJBUtLjTvGVI1PPphLEW2LAFb/FdnCh0tQIPnC
         QjXPdj6PMV7LT7biwuJ5arXzrBXK2yuNFgTahwXuWP4i5NEUYq0lOVC1roQT/3LGuCsP
         FNiftJ8raQqXlU9FBwpS64QYtEupSah+cT8/5OIr7arvrlEOkHXOhnC30FT/cMzEhTNu
         loqQ==
X-Gm-Message-State: APjAAAVdbzATFaEBIaxDlHRqihd4wW/Doy6Tg4pZVWV9BJmQhqzWBpZL
        4wWcMIGI4hDb5lWHrYF30tp5L/suNmA=
X-Google-Smtp-Source: APXvYqzvSdSzlDAanRSyD1+gCAKlRxwBmY9wZ3K7A1gRCQvAUTP7lL0PumlgCYaic91mNvz1oPwOog==
X-Received: by 2002:a63:e145:: with SMTP id h5mr14385538pgk.447.1573794295347;
        Thu, 14 Nov 2019 21:04:55 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id y16sm9078871pfo.62.2019.11.14.21.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 21:04:54 -0800 (PST)
Date:   Thu, 14 Nov 2019 21:04:53 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes
Message-ID: <20191115050453.zcgijwj7qt7uvx2c@pburton-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pl2idvt5zzjql3wu"
Content-Disposition: inline
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--pl2idvt5zzjql3wu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here's a single fix for SGI IP27 machines & a MAINTAINERS update; please
pull.

Thanks,
    Paul


The following changes since commit d6d5df1db6e9d7f8f76d2911707f7d5877251b02:

  Linux 5.4-rc5 (2019-10-27 13:19:19 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.4_4

for you to fetch changes up to f6929c92e283a35b183c293574adcbca409bf144:

  MAINTAINERS: Remove Kevin as maintainer of BMIPS generic platforms (2019-11-04 10:46:05 -0800)

----------------------------------------------------------------
A fix & simplification for SGI IP27 exception handlers, and a small
MAINTAINERS update for Broadcom MIPS systems.

----------------------------------------------------------------
Florian Fainelli (1):
      MAINTAINERS: Remove Kevin as maintainer of BMIPS generic platforms

Thomas Bogendoerfer (1):
      MIPS: SGI-IP27: fix exception handler replication

 MAINTAINERS                      |  1 -
 arch/mips/sgi-ip27/Kconfig       |  7 -------
 arch/mips/sgi-ip27/ip27-init.c   | 21 ++++++---------------
 arch/mips/sgi-ip27/ip27-memory.c |  4 ----
 4 files changed, 6 insertions(+), 27 deletions(-)

--pl2idvt5zzjql3wu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXc4x9QAKCRA+p5+stXUA
3ScnAQCKK/Wzy90fKGnlhiXB2z+7Pdh0MLceC7rOkwdQJgs28wEA6DipbI11TQXU
xe1El0zhm2K0aKV1hvHm7Q2ImjcYmAU=
=0h92
-----END PGP SIGNATURE-----

--pl2idvt5zzjql3wu--
