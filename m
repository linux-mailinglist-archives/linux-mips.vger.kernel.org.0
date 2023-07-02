Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13395744BE3
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jul 2023 02:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjGBAPK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jul 2023 20:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjGBAPK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jul 2023 20:15:10 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E334E10D0
        for <linux-mips@vger.kernel.org>; Sat,  1 Jul 2023 17:15:08 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id Fkk5qsmaFPm6CFkk6qpCr0; Sun, 02 Jul 2023 02:15:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688256907; bh=0xPV1SbzfU6QFy8LKKRYigY2tyYLNV24h8E6RGssy6Q=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=kM/9bihQGJlK9Xcu89EECHyoNUQNBbounxewuORx3XEDf4HVDS6xlkJdzlMKcRiht
         BYImwJF5Aer6ri8uWZ7z2Q+Oeg5s9mE7HJ7ZCNJlcD7ZNTN4mxXYWcYvusAXtA/kWo
         HgdVvsH2O3W0Fls3hQyEUEfeyiLbq33dFYFihj/4uRQMlNZaQW0ivJz3BlyTNN5rsa
         rheN6rXsqZYcGTttsWQP6rshUsdSE+dVfmwum1zBQMTMJ+sYJG7nu9BLyvmLc6dBW7
         qC8NXpfi6gXpGAyhii4E10x2TBTtYR6m2GHRFPaWXLaeyUCXysdQg2T2aJ0B15LgAL
         yqGahoaJfSwhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688256907; bh=0xPV1SbzfU6QFy8LKKRYigY2tyYLNV24h8E6RGssy6Q=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=kM/9bihQGJlK9Xcu89EECHyoNUQNBbounxewuORx3XEDf4HVDS6xlkJdzlMKcRiht
         BYImwJF5Aer6ri8uWZ7z2Q+Oeg5s9mE7HJ7ZCNJlcD7ZNTN4mxXYWcYvusAXtA/kWo
         HgdVvsH2O3W0Fls3hQyEUEfeyiLbq33dFYFihj/4uRQMlNZaQW0ivJz3BlyTNN5rsa
         rheN6rXsqZYcGTttsWQP6rshUsdSE+dVfmwum1zBQMTMJ+sYJG7nu9BLyvmLc6dBW7
         qC8NXpfi6gXpGAyhii4E10x2TBTtYR6m2GHRFPaWXLaeyUCXysdQg2T2aJ0B15LgAL
         yqGahoaJfSwhg==
Date:   Sun, 2 Jul 2023 02:15:05 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 0/3] Cleanup Octeon DWC3 glue code
Message-ID: <ZKDBiY6TKdDKIFK+@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfGk7Uh6B7iKdQ7pchZfbrOxWyPoNOY1T/wK5rvC49x1TiMSXlIO6Eo4NiQ7AGElulRScAiZIwQ8dEb0GHtXpG3NhRUskRuIDofvYm2RdSZ289LHQvOYU
 I1oOfO0WCSCHLQD03pYYC77YNeuUojvFcJhu62H0XuM3rFEUYtaANiRDT7wVadgrm5WmynxclUN+zH/pZzqlhFb5MCQ5p1OFDQAORm93g/2ozUG2GEGQIeAT
 2Fu24jxY98Cr73IoFGmQmeDgjKODgIiVxZtqCaeOaHv8S5SR3GOJzQqdfJtcDlrXlKlJi0A7UlD3X3/RZW4BCvyg8KAGKWQkbdU44PDS5aDNlVHV7bEbMT2H
 szq5ElWm
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

primary motivation was to fix issue Id 29206 as described in
OCTEON III CN70XX/CN71XX Known Issues, version: 1.9.
Said document is marked as Marvell Proprietary and Confidential,
therefore I'm not sure if I can cite from it.

This probably does not matter too much as the root of the information
listed there is a workaround being implemented in OCTEON SDK 3.1.2
patch 7 and later in
u-boot/drivers/usb/host/xhci-octeon.c:dwc3_uphy_pll_reset()

My coleague ported that patch to linux-4.9 and I will later modify
it to work on top of current glue driver.

The glue code currently lives in arch/mips/cavium-octeon/octeon-usb.c
and loops for each "cavium,octeon-7130-usb-uctl" compatible.
However there is no bond with dwc3 core code, so if anything goes
wrong in glue code, the loop breaks, leaving dwc3 in reset.

Later on when dwc3 core tries to read any device register, bus error
is emited, leading to kernel panic.

Therefore move it to drivers/usb/dwc3 while making it glue driver.

This is a second attempt, see changelog appended to patches.

Ladislav Michl (3):
  usb: dwc3: dwc3-octeon: Convert to glue driver
  usb: dwc3: dwc3-octeon: Move node parsing into driver probe
  usb: dwc3: Add SPDX header and copyright

 arch/mips/cavium-octeon/Makefile              |   1 -
 arch/mips/cavium-octeon/octeon-platform.c     |   1 -
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 .../usb/dwc3/dwc3-octeon.c                    | 262 +++++++++---------
 drivers/usb/dwc3/dwc3-of-simple.c             |   1 -
 6 files changed, 142 insertions(+), 134 deletions(-)
 rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (80%)

-- 
2.39.2

