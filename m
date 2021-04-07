Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE438357436
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 20:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355217AbhDGS0j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 14:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348515AbhDGS0h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 14:26:37 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBD7C06175F;
        Wed,  7 Apr 2021 11:26:27 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id p22so1720325wmc.3;
        Wed, 07 Apr 2021 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=U9FkdGonL0Lj6ZngrSyr56gWP7PTwMnm5uWJ2GRC1ZI=;
        b=iu39AjMNT+uytFyYuXDEVcLJCViOftzd7/K9HBf2+1prHRG601APc0+iwRM4Ju95Jh
         bODzEhoi80DGg1E6sGkAFF8k6hKi1yEajGuOm7cp+gmopa4KTf0+CVinRIlE+nu7agPJ
         sZkS7GGqI5byEmpqY0+B/xy5IU5YEOg1TIrdT63PXJ6Vtr9veFqUhewPSWgj+Qvlkkrf
         vS41JYS6hj5HahmbjCBH4J3ZODIMEWnIv+jxflIIaudiWHewGArsJtZ5S2L8fFZ7tWII
         aIzQsecQqtEAC4V28LMqk4qt4nUx9yCje3v4Y+6QPgGfQtEtMp5h3FdubsJGB+CzpBbC
         WzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=U9FkdGonL0Lj6ZngrSyr56gWP7PTwMnm5uWJ2GRC1ZI=;
        b=oIiClxNIFIgmuOlJ4iw1/biMZwIW3epyHQSlpuUAqJIkgysIawAh4rUHqBLwCbUBMR
         O7Rm+IcyjehTVGd8u2Y0MHpnAYxkAjxEjGOG+PD0UYEWMEacPOCFh/bojDBwN1aBNThq
         xiyhTLPLVkpHhf9J78K0ATNyvrVciHQBZmkVHpFFOMDGRwd8WJS6h7cW84Z9kRhqC4Tj
         +X+zv1auHu7xsJgf1Pa+ENpxeHBvgqTDjA2oopHS+0xcS1CxLsHFi1L5MtO/Z/6YA5EI
         oZFGHOQRIczvlklkzq6Pjn5K6xFtpiCkIMMQVLYtHfB7NGGfLsFhO1TLK+30RqvA9Sop
         cv3A==
X-Gm-Message-State: AOAM53317n1ioGGPWIyFV30BiNI3Tqgs+RuDjChGs5X6DQW4LPBLF5Ad
        9sBPVOCDNesiTC3bhP/jsMPxVNB4tdgGpA==
X-Google-Smtp-Source: ABdhPJyynsH8EpUmOnpLJJ+xeyLzhaNWw5/netDJVytbmNKqi8ochqHpCxd9zJzJ2pteKs7vVXI2+w==
X-Received: by 2002:a1c:4184:: with SMTP id o126mr4207110wma.40.1617819986159;
        Wed, 07 Apr 2021 11:26:26 -0700 (PDT)
Received: from debian (host-84-13-30-150.opaltelecom.net. [84.13.30.150])
        by smtp.gmail.com with ESMTPSA id a3sm21577544wru.40.2021.04.07.11.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 11:26:25 -0700 (PDT)
Date:   Wed, 7 Apr 2021 19:26:24 +0100
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: build failure of malta_qemu_32r6_defconfig
Message-ID: <YG35ULOblq/gUZmh@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

I was building v5.10.28 with malta_qemu_32r6_defconfig and noticed that
it fails to build, so tried next-20210407 to see if it has been fixed.
But linux-next also has the issue with gcc-10.

The error is:

./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_gettime':
./arch/mips/include/asm/vdso/gettimeofday.h:103:2: error: the register 'lo' cannot be clobbered in 'asm' for the current target
  103 |  asm volatile(
      |  ^~~
./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_gettimeofday':
./arch/mips/include/asm/vdso/gettimeofday.h:33:2: error: the register 'lo' cannot be clobbered in 'asm' for the current target
   33 |  asm volatile(
      |  ^~~
./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_getres':
./arch/mips/include/asm/vdso/gettimeofday.h:123:2: error: the register 'lo' cannot be clobbered in 'asm' for the current target
  123 |  asm volatile(
      |  ^~~
./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_gettime64':
./arch/mips/include/asm/vdso/gettimeofday.h:57:2: error: the register 'lo' cannot be clobbered in 'asm' for the current target
   57 |  asm volatile(
      |  ^~~

Any idea how to fix this? Please ignore if it has been reported before.


--
Regards
Sudip
