Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74573774104
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbjHHRNp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbjHHRMz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:12:55 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEA01981
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 09:05:23 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id TJ9yqMTRCv5uITJA0qW2v3; Tue, 08 Aug 2023 11:37:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691487472; bh=oEUSNGCw0ybxXydxB+QbP+KHQ2Vpk2Jeqtkmtb/Yn1A=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=oWvWF6ctUorUbjEkXztq1EL9qWgyYP8epH4QHHRUCenyzwDcphM2JFPmJJy+7QUYG
         WHqBSbDaHUslADtQNkRSgeAam+cPDYSJ5UyoAYUGwDNGhI0e21RAA41u+AC2Br51Nn
         ZnuZC6x2vX0H0B1E2tZi53tvYhwc1xirZUW6MKZ3IANZDYwbyufqT/JTDIsJQvaK0o
         wWjA7Il598EfhQ3VqjH5yo7u6USE075NZa+DmTzM4q/MrSV+ENP3nsR6+TcUf6OMuo
         sTsC6fhrzrumPq+a1l8Tlb/3oW1YnKI6OEMWzvfwJXZ1ZTvBFauCJGr3GMy4+0xICH
         Khusseph+9tsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691487472; bh=oEUSNGCw0ybxXydxB+QbP+KHQ2Vpk2Jeqtkmtb/Yn1A=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=oWvWF6ctUorUbjEkXztq1EL9qWgyYP8epH4QHHRUCenyzwDcphM2JFPmJJy+7QUYG
         WHqBSbDaHUslADtQNkRSgeAam+cPDYSJ5UyoAYUGwDNGhI0e21RAA41u+AC2Br51Nn
         ZnuZC6x2vX0H0B1E2tZi53tvYhwc1xirZUW6MKZ3IANZDYwbyufqT/JTDIsJQvaK0o
         wWjA7Il598EfhQ3VqjH5yo7u6USE075NZa+DmTzM4q/MrSV+ENP3nsR6+TcUf6OMuo
         sTsC6fhrzrumPq+a1l8Tlb/3oW1YnKI6OEMWzvfwJXZ1ZTvBFauCJGr3GMy4+0xICH
         Khusseph+9tsw==
Date:   Tue, 8 Aug 2023 11:37:50 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Thinh.Nguyen@synopsys.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] usb: dwc3: dwc3-octeon: Verify clock divider
Message-ID: <ZNIM7tlBNdHFzXZG@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfHcEf2zBKR7/2Uinq9Z4a3Cavgvad8nW6HgFS9chK9ma4OnR8Nzo3K9+h3eC9TRkFk0e8LdyC08HD8WugWuJV7PIeRT/ErG9XUCwSvTiWYRU3Y49QiYp
 msOsH3btHP7amOrFBFtOpcbEKQ5hayObiq4YZkFth0Vl3LK80Y1qLcW6pLA7agUSVL2Gw/T/soWilybb/sdsTbNMiEX2SovGumZ147kuZ04pBtCGyyOz9qiV
 mMjL5mh3X7GolieMwUqFsfFvqmUAyrYq6hmxoZwJMtUamS7WlyStjHqe8Syv+OM2C5GbSGftkkLqLm9hsQ7C1tP44ALdgKtm4kr4jOpVCLFH+mAy+dD7yDJ7
 WLwqAoCdORynb4/4MimcwljXmve0MOzzHX63uw/gWhRnCGQEIZOjvLMWiQt9b5qnCaNsmo2d5yQ1sZ6TvAE5iiM7k7ZgMf6xwbmDHh1b9+vg174zFDXDqZIr
 4AnrF5N3iv4VER0P4lIOME36F0v1Hdgfb4iYkw==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Although valid USB clock divider will be calculated for all valid
Octeon core frequencies, make code formally correct limiting
divider not to be greater that 7 so it fits into H_CLKDIV_SEL
field.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
---
 Greg, if you want to resent whole serie, just drop me a note.
 Otherwise, this patch is meant to be applied on to of it.
 Thank you.

 drivers/usb/dwc3/dwc3-octeon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 6f47262a117a..73bdcebf465c 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -251,11 +251,11 @@ static int dwc3_octeon_get_divider(void)
 	while (div < ARRAY_SIZE(clk_div)) {
 		uint64_t rate = octeon_get_io_clock_rate() / clk_div[div];
 		if (rate <= 300000000 && rate >= 150000000)
-			break;
+			return div;
 		div++;
 	}
 
-	return div;
+	return -EINVAL;
 }
 
 static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
@@ -289,6 +289,10 @@ static int dwc3_octeon_setup(struct dwc3_octeon *octeon,
 
 	/* Step 4b: Select controller clock frequency. */
 	div = dwc3_octeon_get_divider();
+	if (div < 0) {
+		dev_err(dev, "clock divider invalid\n");
+		return div;
+	}
 	val = dwc3_octeon_readq(uctl_ctl_reg);
 	val &= ~USBDRD_UCTL_CTL_H_CLKDIV_SEL;
 	val |= FIELD_PREP(USBDRD_UCTL_CTL_H_CLKDIV_SEL, div);
-- 
2.39.2

