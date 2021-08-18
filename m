Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FC53EFD78
	for <lists+linux-mips@lfdr.de>; Wed, 18 Aug 2021 09:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239025AbhHRHMU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Aug 2021 03:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239029AbhHRHMR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Aug 2021 03:12:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE18EC061796;
        Wed, 18 Aug 2021 00:11:42 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id q11-20020a7bce8b0000b02902e6880d0accso3694576wmj.0;
        Wed, 18 Aug 2021 00:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBcT9Ehn8+rYzZMI98f1umNL2Nc3VUU+xC0Yy1mTns4=;
        b=hyLXsxw32h4vZiIfWeGI1ExAtevZHYxhPqtH+JlMtiR7qQsqgFhOButjBhVu12IUZl
         8i2zUs0rjsRZ13d4LwTSyzJTQWsJPR4S921VHCZ+uFrWHTUrkp3Y+SEyS80+nfhVQy8d
         R3tuk6bO1ImDMdYvck4n6pVCrA/DjQ9NwAfiAAIcj+LOmMaaYsLVBPnr2+OL+bQ9lva6
         YduByW2qsOex68WIBk6btulxKZyVo0iv1JW1XelXSKyTTYwfMc6DUGtqwp6ztFL3Jnyg
         k7CldYJBgsqeooS4ur88XNxL7KiOgGtjO4P6HY7zVUJuppXbH0hEU7QSCN/RwmFfafh6
         nPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBcT9Ehn8+rYzZMI98f1umNL2Nc3VUU+xC0Yy1mTns4=;
        b=T8/2W2VdUadZeDkRL91HRHzokugErs3NAeU8i7fKXROEVyXqydB0/8ugjWLt+7KRtm
         woihvTBmib8ssa89icczNw3qyBCRdORno4uPXBAFE3waEjETIDvl9lM1OgWjP9sc0feI
         EeeN3b6rwxjY5NYAuEoL0K26Z6pXCpCSL1mtPhuM24knv0A42iDmKGeJH6se+LdR9rcF
         zenfUWbvi9K0KxPKa62KF9HCMaVeMOWk+NkHKFMIq6V6HXuLGtvv0ejTCtfQcjnaVblN
         qFoqvyrbvj0XjURxfX/qYEHfBg6h39Z0/WY+F1zZ2+yIH+zH6gJpaoPLcFxjzBvabdMT
         O+1g==
X-Gm-Message-State: AOAM533hSsoVpe5B4Vwsh2AwRmcwmrsrlU1HbIm8zC0MHHpSDfJ+QNjU
        FDGPmo2J+dNv6Kg5pcwPef8=
X-Google-Smtp-Source: ABdhPJxsyyz4OJQia2wbMYotlnmt+XTl4NZIX4lJ8YAP3muJWbAy9X8wlXBdzsNLEwld4d7dZxHb7w==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr7085027wmq.154.1629270701246;
        Wed, 18 Aug 2021 00:11:41 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt. [84.90.178.246])
        by smtp.gmail.com with ESMTPSA id r10sm4925729wrp.28.2021.08.18.00.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 00:11:40 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 0/3] Kconfig symbol clean-up on usb
Date:   Wed, 18 Aug 2021 09:11:34 +0200
Message-Id: <20210818071137.22711-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Dear Greg,

The script ./scripts/checkkconfigsymbols.py warns on invalid references to
Kconfig symbols (often, minor typos, name confusions or outdated references).

This patch series addresses all issues reported by ./scripts/checkkconfigsymbols.py
in ./drivers/usb/ for Kconfig and Makefile files. Issues in the Kconfig and
Makefile files indicate some shortcomings in the overall build definitions, and
often are true actionable issues to address.

These issues can be identified and filtered by:

  ./scripts/checkkconfigsymbols.py | grep -E "drivers/usb/.*(Kconfig|Makefile)" -B 1 -A 1

After applying this patch series on linux-next (next-20210816), the command
above yields just one further issues to address:

ARCH_VERSAL
Referencing files: drivers/usb/dwc3/Kconfig

For this remaining issue, I already contacted Manish Narani, the contributor of
./drivers/usb/dwc3/, to clarify the intent of that config dependency.

Please pick this patch series into your usb-next tree.

Best regards,

Lukas

Lukas Bulwahn (3):
  usb: host: remove dead EHCI support for on-chip PMC MSP71xx USB
    controller
  usb: host: remove line for obsolete config USB_HWA_HCD
  usb: remove reference to deleted config STB03xxx

 drivers/usb/Kconfig            |   2 +-
 drivers/usb/Makefile           |   1 -
 drivers/usb/host/Kconfig       |   9 -
 drivers/usb/host/ehci-hcd.c    |   5 -
 drivers/usb/host/ehci-pmcmsp.c | 328 ---------------------------------
 5 files changed, 1 insertion(+), 344 deletions(-)
 delete mode 100644 drivers/usb/host/ehci-pmcmsp.c

-- 
2.26.2

