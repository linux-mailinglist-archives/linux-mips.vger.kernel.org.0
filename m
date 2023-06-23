Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEF973B226
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jun 2023 09:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjFWH5O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jun 2023 03:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFWH5O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jun 2023 03:57:14 -0400
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BD910D
        for <linux-mips@vger.kernel.org>; Fri, 23 Jun 2023 00:57:11 -0700 (PDT)
Received: from lenoch ([80.95.121.122])
        by cmgsmtp with ESMTPSA
        id CbfIqcb0fPm6CCbfJqV2Gq; Fri, 23 Jun 2023 09:57:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687507029; bh=QoB62eMd+PzjPV+XKDJnYkzx9hrgIoE2s5IcTPgrTbc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=39BWEsiCVRja17yq8umxc+tiFN/Nqm3cl0ydBLKR4gqK/iRlKG+VLGtC1h1uBwV7d
         J2+qVXYZ11aIP3TOzIOp44hwmIPTSf2xNz3XK4kz3JS9fr3qIyZtqOkxgxXG8hnZze
         3VHkyi3t4cmGPOZqCB0skG4+pQsBpP/Wy2ETekFOLLZuuH0wUOo1NrGls92sOS8maB
         90Q2EIjcU18Nt8D6JolsVB4EPDiqQH8cZTW3qdJMO+ccciOEAMv5Stw23Z0WdxkWsB
         ejWRbBh3oBOqGWWZwtOagoEc8LlW7m5kBL+ywDpfQ26nl46PmzTwC/ixT47cHSQBLh
         9FZHY+MG7fOAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687507029; bh=QoB62eMd+PzjPV+XKDJnYkzx9hrgIoE2s5IcTPgrTbc=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=39BWEsiCVRja17yq8umxc+tiFN/Nqm3cl0ydBLKR4gqK/iRlKG+VLGtC1h1uBwV7d
         J2+qVXYZ11aIP3TOzIOp44hwmIPTSf2xNz3XK4kz3JS9fr3qIyZtqOkxgxXG8hnZze
         3VHkyi3t4cmGPOZqCB0skG4+pQsBpP/Wy2ETekFOLLZuuH0wUOo1NrGls92sOS8maB
         90Q2EIjcU18Nt8D6JolsVB4EPDiqQH8cZTW3qdJMO+ccciOEAMv5Stw23Z0WdxkWsB
         ejWRbBh3oBOqGWWZwtOagoEc8LlW7m5kBL+ywDpfQ26nl46PmzTwC/ixT47cHSQBLh
         9FZHY+MG7fOAw==
Date:   Fri, 23 Jun 2023 09:57:07 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Message-ID: <ZJVQUzVW+NzCgH7i@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <20230622230149.4wpvtlpsu7473txr@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622230149.4wpvtlpsu7473txr@synopsys.com>
X-CMAE-Envelope: MS4wfJintxM30TZ37w43kOiAuZzWtIgmzBHD7Ryj8hATIO+pMyEsNl7d+h9w1CY8UImasrX/+ReVLUCZVg7jmN8YTDHNx1/J6mzdtPYgf5e/SbHjOSbsloL7
 7EUY/JM916nb/gwmm7VelEjBrsmUcHq9GHIhRwDGmb06HloLXNS4y+0zXg+ZUfs/IZ1qwhohgK8WYayTD8zo3yqDTJBb7Hxhpdi3vCcwMBXRpE32opQTbMOR
 167XoQYQv1a+l3HmVvjv9Q==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Jun 22, 2023 at 11:01:54PM +0000, Thinh Nguyen wrote:
> Hi,
[snip]
> Please use get_maintainer.pl to get all the proper maintainers to review
> the changes.

That's what I did. Thomas, MIPS maintainer is reading linux-mips list,
Greg is reading linux-usb list, you were the one who receives changes,
hence all patcheset was sent to you in a hope you provide some comments
about actual code changes.

> Since this is a large change involving different subsystems, if
> possible, please split the changes related to MIPS and try to upstream
> those first as they will affect how dwc3 glue driver will look.

That's pretty straightforward as patchset is arranged exactly this way,
so MIPS maintainer is free to apply patches till driver move.
However, any actual feedback would be still usefull. In case it gets
some acks I'll add them and rebase patches to the latest -next.

> Thanks,
> Thinh

Thanks,
ladis
