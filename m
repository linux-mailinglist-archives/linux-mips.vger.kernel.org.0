Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAEDB7691B7
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jul 2023 11:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbjGaJaU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 05:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjGaJaQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 05:30:16 -0400
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB6711A
        for <linux-mips@vger.kernel.org>; Mon, 31 Jul 2023 02:30:11 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id QPE7qwTWXPm6CQPE9qqHfW; Mon, 31 Jul 2023 11:30:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795809; bh=FJvsu4iHz7LlLoSC5mTMPqjMrKbVvLW3fMJY+nhU7+Y=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=0yUr4NULQ0reqfTq2s6wpq9Uf7CAk/Cln+xAHLu4qXoDiYhhB592F3hfZiC6sfWL0
         XZfH+EFELvhjSSnWE06X+Pf7Amz8xA/SYYop2r89/zg2pALkawxS0H+ocearuaoXbk
         3S4BByuPg5onnDuFY/B+97Fs8wFTVYr14cwecmtueqiWlee9CCiPGS89kHxpEBBw0F
         OMpysEmO8nNj/ScUtJUbGRa9d24nQWysQToyaDYHJGi2HnCBb0CcwXZHFuH/qqRe+d
         xXTZazVYaoTxWkYRjXLHpiWthd+TLxJHV1Sjg6VEhX5yAd8NiX0gOshkbiXTqP4SYu
         QmZV1f41qHC3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690795809; bh=FJvsu4iHz7LlLoSC5mTMPqjMrKbVvLW3fMJY+nhU7+Y=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=0yUr4NULQ0reqfTq2s6wpq9Uf7CAk/Cln+xAHLu4qXoDiYhhB592F3hfZiC6sfWL0
         XZfH+EFELvhjSSnWE06X+Pf7Amz8xA/SYYop2r89/zg2pALkawxS0H+ocearuaoXbk
         3S4BByuPg5onnDuFY/B+97Fs8wFTVYr14cwecmtueqiWlee9CCiPGS89kHxpEBBw0F
         OMpysEmO8nNj/ScUtJUbGRa9d24nQWysQToyaDYHJGi2HnCBb0CcwXZHFuH/qqRe+d
         xXTZazVYaoTxWkYRjXLHpiWthd+TLxJHV1Sjg6VEhX5yAd8NiX0gOshkbiXTqP4SYu
         QmZV1f41qHC3A==
Date:   Mon, 31 Jul 2023 11:30:07 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 0/7] Cleanup Octeon DWC3 glue code
Message-ID: <ZMd/HzISn0mPsNWt@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfN9lhny+goh06RwvfP/yh2HCmdPpW4cOn1GuxtaIBZh1axD2Ii43hvefqusbxBxXDq3PcXc6EftuI39SuTsDF2PanXzBQ4HGFzma58m3nWD6ztKws5M3
 iXnQ8QmplEmfU6DhcU7/CLrB2fP/gfz7c62Lvzdq5uxrpuQISmNMdWJSYlLqXk5jVrt1FqJBA3VAGXuPmmJDzIrbDH5bO39kVJlhcLkNCSafPj7jnkofP6d0
 qdIOjJ+i1oODLXChF82zYPUPM95cRmnSzaiL5zcJ+rw0jZxlPc8TeZsieY/ooc9qXHf6oGlasGwhYALsEcooL65vgijOvM9gf+VbtkelD7y4OXmuRLko+ClD
 AsLPDomQ
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 
This is a fifth attempt splitted between more patches with warnings
for 32bit test targets silenced, see changelog appended to them.

Ladislav Michl (7):
  usb: dwc3: dwc3-octeon: Convert to glue driver
  usb: dwc3: dwc3-octeon: Use _ULL bitfields defines
  usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup functions
  usb: dwc3: dwc3-octeon: Avoid half-initialized controller state
  usb: dwc3: dwc3-octeon: Move node parsing into driver probe
  usb: dwc3: dwc3-octeon: Dump control register on clock init failure
  usb: dwc3: dwc3-octeon: Add SPDX header and copyright

 arch/mips/cavium-octeon/Makefile              |   1 -
 arch/mips/cavium-octeon/octeon-platform.c     |   1 -
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 .../usb/dwc3/dwc3-octeon.c                    | 429 +++++++++---------
 drivers/usb/dwc3/dwc3-of-simple.c             |   1 -
 6 files changed, 220 insertions(+), 223 deletions(-)
 rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (61%)

-- 
2.39.2

