Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46BE754EF3
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jul 2023 16:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjGPONe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Jul 2023 10:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjGPONd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Jul 2023 10:13:33 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB4B10C9
        for <linux-mips@vger.kernel.org>; Sun, 16 Jul 2023 07:13:32 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id L2V7qGGTuv5uIL2V8qf7Lm; Sun, 16 Jul 2023 16:13:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689516810; bh=bEbz8kW72RfPPUK6lrL6116xQFWyIZKiaY/+d1Zl7s4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=VrZltaYquLGsxnuqJ2jgftnWqdX9pKZz5OEhkQidmpeRrr4UeYo4mcnMCG0ifuGtC
         dsIWiLqGAiRNkALhAl59aSssix/W8BCyEyzdHN/teSNGJ9j0UMY4tO7rJ7WbZq1rXP
         nfcmy8NAGRxlQHLfpBVUhhwSelnFrOJQWCZokNbdOCkxKcqus0VRsbHVPojCQ4Nrgb
         yPBYKz67F951RJN5uVfPgY4fJtFJPyiGHSZHnRdfpCnIYX3EtAcUpA3ZKjkXgGcjCC
         39+AgvZ8m41e5+z04fuXfpJWx4ZVICevcg3Tzh3vJT4viCEaMzBksqckQQ+lmZSPGN
         YJ2JNziVBplRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689516810; bh=bEbz8kW72RfPPUK6lrL6116xQFWyIZKiaY/+d1Zl7s4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=VrZltaYquLGsxnuqJ2jgftnWqdX9pKZz5OEhkQidmpeRrr4UeYo4mcnMCG0ifuGtC
         dsIWiLqGAiRNkALhAl59aSssix/W8BCyEyzdHN/teSNGJ9j0UMY4tO7rJ7WbZq1rXP
         nfcmy8NAGRxlQHLfpBVUhhwSelnFrOJQWCZokNbdOCkxKcqus0VRsbHVPojCQ4Nrgb
         yPBYKz67F951RJN5uVfPgY4fJtFJPyiGHSZHnRdfpCnIYX3EtAcUpA3ZKjkXgGcjCC
         39+AgvZ8m41e5+z04fuXfpJWx4ZVICevcg3Tzh3vJT4viCEaMzBksqckQQ+lmZSPGN
         YJ2JNziVBplRQ==
Date:   Sun, 16 Jul 2023 16:13:29 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 0/6] Cleanup Octeon DWC3 glue code
Message-ID: <ZLP7CSUm095ADtdw@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfP7AFq15JbiSpcyDfxfmj3B/7o/1I0X06d5h1qk1a4JeBU+FS+Vjj887dnhEwQuOsVzWcJhmpm+Fdf4IyCwY1RRe7Cr+ZmBZ6+Nfi9dQNqvmLWxlu4pM
 sAYuAM6WnhUydGLkQjeW9n5gyaFhquPXSNXx4VgocoerzwE+TaRTXNYzgZRGX8REDRaSfDI/KEzI9szCRgzj2qcXL7J/ovCMinFOCZRqlr4wCqOjqfl5GZPa
 AtPBxry1hMOAx1DpvzZplm6EU1IL2168/lA4udtV9U1onv0tb0Z6dAjmdYqFMniTsYsS2lrHCCRuklr9loThypn4xgvy3e4FHv6GoKoMsPy7BN8EUlSYLAE/
 UaesUgb/
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi!

The glue code currently lives in arch/mips/cavium-octeon/octeon-usb.c
and loops for each "cavium,octeon-7130-usb-uctl" compatible.
However there is no bond with dwc3 core code, so if anything goes
wrong in glue code, the loop breaks, leaving dwc3 in reset.
  
Later on when dwc3 core tries to read any device register, bus error
is emited, leading to kernel panic.

Therefore move it to drivers/usb/dwc3 while making it glue driver.
 
This is a fourth attempt splitted between more patches, see changelog
appended to them.

Ladislav Michl (6):
  usb: dwc3: dwc3-octeon: Convert to glue driver
  usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup functions
  usb: dwc3: dwc3-octeon: Avoid half-initialized controller state
  usb: dwc3: dwc3-octeon: Move node parsing into driver probe
  usb: dwc3: dwc3-octeon: Dump control register on clock init failure
  usb: dwc3: dwc3-octeon: Add SPDX header and copyright

 arch/mips/cavium-octeon/Makefile              |   1 -
 arch/mips/cavium-octeon/octeon-platform.c     |   1 -
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 .../usb/dwc3/dwc3-octeon.c                    | 351 +++++++++---------
 drivers/usb/dwc3/dwc3-of-simple.c             |   1 -
 6 files changed, 181 insertions(+), 184 deletions(-)
 rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (72%)

-- 
2.39.2

