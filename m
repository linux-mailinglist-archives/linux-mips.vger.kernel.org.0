Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B44753339
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jul 2023 09:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbjGNHiB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jul 2023 03:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbjGNHiA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jul 2023 03:38:00 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B6222D78
        for <linux-mips@vger.kernel.org>; Fri, 14 Jul 2023 00:37:57 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id KDN3qpfn8Pm6CKDN6qEdvv; Fri, 14 Jul 2023 09:37:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689320275; bh=e3brQTgAlwjVcEo0gkcFzp7kBvogisoDYeHS96bk73o=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=XsIYvkWZMFdlGKV1LgSGrHtdgpLfZOFddHuts0uC8cKNCzfXhj3NI1/Lz7idNvFit
         I0h1wnC9r0N8+Dlznp8WHeWg9RjHtJh0bc4sDhwEcmHV4pjHQqhkSB1HlujkfVfaQh
         FhKclJHDihwI2g5GJgF4uDnz7lnopecD2DU2PZdG+PX5P0h8F3gpsLOW8pGwedvJ9+
         vu9XFOFqZ78qRHur+TXglvdgj7Z0mvXW+2W6nKYGIUboHIPq1vfHE4+JEP8TbE7rvO
         M6ZLW/Cy63PLkUBqU5yxvKgLJLO8yN5yrvjAUNVUOYrtLxHjk3Kr0a7YZxphXG39u8
         lykiA/h3Xb6qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1689320275; bh=e3brQTgAlwjVcEo0gkcFzp7kBvogisoDYeHS96bk73o=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=XsIYvkWZMFdlGKV1LgSGrHtdgpLfZOFddHuts0uC8cKNCzfXhj3NI1/Lz7idNvFit
         I0h1wnC9r0N8+Dlznp8WHeWg9RjHtJh0bc4sDhwEcmHV4pjHQqhkSB1HlujkfVfaQh
         FhKclJHDihwI2g5GJgF4uDnz7lnopecD2DU2PZdG+PX5P0h8F3gpsLOW8pGwedvJ9+
         vu9XFOFqZ78qRHur+TXglvdgj7Z0mvXW+2W6nKYGIUboHIPq1vfHE4+JEP8TbE7rvO
         M6ZLW/Cy63PLkUBqU5yxvKgLJLO8yN5yrvjAUNVUOYrtLxHjk3Kr0a7YZxphXG39u8
         lykiA/h3Xb6qw==
Date:   Fri, 14 Jul 2023 09:37:40 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 0/3] Cleanup Octeon DWC3 glue code
Message-ID: <ZLD7RHvE4eRPoqKN@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfBkBvEZmK/yGKWfASYyuwLawpSwltelTyg+2mycyxFLnYcCphh/y6jImrvZRr/fUhWVxv9QY9lcfFA6xEcN9XAFBh0/A7iKyj23rFxK7eHGux9P9vlB1
 CYMd3wCXY3IzKm3jBMOPTSCT2zEgJM1lga3eAphfEDJWwNw9ORADIIG+vdk3hAjdYPm+/VQVeosDZ2JAhcRik/ukl+J+vlcehLQKvElKlpC7+jUR5TSAvCtS
 9SbDE5g3gUlxzCkUe/XEKWLkcf73E7agEIHOzAolUe4fwMelEbWTSkgN/Az5wOempKt6f8C/hIce1OBpRJv6LEuOmgETpSFmaD7EqK4TxN10k4fQUo+wzmeU
 6+nNJHiQ
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 
This is a third attempt, see changelog appended to patches.

Ladislav Michl (3):
  usb: dwc3: dwc3-octeon: Convert to glue driver
  usb: dwc3: dwc3-octeon: Move node parsing into driver probe
  usb: dwc3: Add SPDX header and copyright

 arch/mips/cavium-octeon/Makefile              |   1 -
 arch/mips/cavium-octeon/octeon-platform.c     |   1 -
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 .../usb/dwc3/dwc3-octeon.c                    | 343 +++++++++---------
 drivers/usb/dwc3/dwc3-of-simple.c             |   1 -
 6 files changed, 177 insertions(+), 180 deletions(-)
 rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (75%)

-- 
2.39.2

