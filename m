Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BCC77405F
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbjHHRC3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbjHHRBg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:01:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B577E83FF;
        Tue,  8 Aug 2023 09:01:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C94E6247B;
        Tue,  8 Aug 2023 10:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A741C433C7;
        Tue,  8 Aug 2023 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691488845;
        bh=BGUL+qNSCUWi9ZEQC6QhBehpq2QULwLyZTNcXPm/ovU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2EY1SRBTnioimod2ujKyEau2Qnr4sdRQja7UuuRRyI2wH6u4+yhLvc4QUqRnqtYFP
         89+osvVUdrFemY7ObuzHBB7Q6jVYe+dyqgxIajj6RuDPc4BhkbcmnkJZQ8YPXNVgTp
         NiUapof4K/RgWTVmW/jlURswvN+lYQyK6i7486us=
Date:   Tue, 8 Aug 2023 12:00:42 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org, Thinh.Nguyen@synopsys.com,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] usb: dwc3: dwc3-octeon: Verify clock divider
Message-ID: <2023080830-wincing-goldmine-def9@gregkh>
References: <ZNIM7tlBNdHFzXZG@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNIM7tlBNdHFzXZG@lenoch>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 08, 2023 at 11:37:50AM +0200, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Although valid USB clock divider will be calculated for all valid
> Octeon core frequencies, make code formally correct limiting
> divider not to be greater that 7 so it fits into H_CLKDIV_SEL
> field.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
> ---
>  Greg, if you want to resent whole serie, just drop me a note.
>  Otherwise, this patch is meant to be applied on to of it.

On top of what series?

confused,

greg k-h
