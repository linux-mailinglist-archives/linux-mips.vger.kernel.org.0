Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADFDB656B1D
	for <lists+linux-mips@lfdr.de>; Tue, 27 Dec 2022 14:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiL0NAj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Dec 2022 08:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiL0NAi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Dec 2022 08:00:38 -0500
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301941158
        for <linux-mips@vger.kernel.org>; Tue, 27 Dec 2022 05:00:34 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id A9ZFp0g7bPm6CA9ZHpzYPE; Tue, 27 Dec 2022 14:00:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1672146032; bh=0zFj23aVOFHwrvvLWeLUo12meYsxcDu1zgiJRN8KYy4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=dMC2As045n9Hp5ofBJg3vDktqOwABx8Dg2zZSg7ojr83L/co979eKUxO3of1zSgZt
         CImZ5lCDqcg3hBnAOHE8ekTe2aO77xKldni20rMVeOQzScocnNnfY5UlaDaYSj6dg0
         lvfIafAyE1gOxIKAefGfzhcLC4qgKmK/9kkC/qoSGFAuYYv1fnPo2pkAUMNFHqTCLT
         WuWw0y/CbbCgBgX1Nsnd+OczKqTwDbYCrtFw+f1FCAG1OeRQC2GOSKutjTgnpwDQIv
         0zOrVnC4o33L95u59NNF2IjEg7AFHPTWwRPOBucxNmBL3hdAkuq4YxY2tnRN6KRbNS
         lzMaFQ7ywlZCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1672146032; bh=0zFj23aVOFHwrvvLWeLUo12meYsxcDu1zgiJRN8KYy4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=dMC2As045n9Hp5ofBJg3vDktqOwABx8Dg2zZSg7ojr83L/co979eKUxO3of1zSgZt
         CImZ5lCDqcg3hBnAOHE8ekTe2aO77xKldni20rMVeOQzScocnNnfY5UlaDaYSj6dg0
         lvfIafAyE1gOxIKAefGfzhcLC4qgKmK/9kkC/qoSGFAuYYv1fnPo2pkAUMNFHqTCLT
         WuWw0y/CbbCgBgX1Nsnd+OczKqTwDbYCrtFw+f1FCAG1OeRQC2GOSKutjTgnpwDQIv
         0zOrVnC4o33L95u59NNF2IjEg7AFHPTWwRPOBucxNmBL3hdAkuq4YxY2tnRN6KRbNS
         lzMaFQ7ywlZCg==
Date:   Tue, 27 Dec 2022 14:00:29 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-mips@vger.kernel.org
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        YunQiang Su <wzssyqa@gmail.com>,
        Anushka Singh <anushka.singh1@wipro.com>,
        Lukasz Majczak <lma@semihalf.com>,
        Peter Swain <peter.swain@marvell.com>
Subject: Moving Octeon ethernet out of staging
Message-ID: <Y6rsbaT0l5cNBGbu@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfB+2pilL/QlGABLJyXWgBaw+WKCPKykJ6mutG5+B1BKK9rNpGNRltLkzWI5TBbrR1DsgO3uGxYdnmqE2OyrC85NDEVE4vZJcg+NDJc7aXxELOrnaBzvQ
 kqY3L6JQELELs7JALlxkcon2napo/uaZNeXoWP1sQlqIzxCGQVl9iqcla/rzvhhZrNQOe3C+j4li+MQOJEj7QnwQY0dfH+3cMtyj2wG2jDQiHbzMT4EK3Yp2
 nRDPrRmimXnljwpH5ms1PBkCa9Y7IXw9iuCnTUVT3WzFyiuERVg0Zju/e0x8sDNiZ5kOQ9/IusVU6D3Kt27JBn6brJWfBo+P9Q1PuZfkrheGRgozpbxVsJmR
 g3s5OizlaVzKDRW2IPEQKowG+Cz1+A==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi there,

Octeon ethernet drivers were once kicked out of staging, just to be
returned back a while after:
https://lore.kernel.org/lkml/20200205001116.14096-1-chris.packham@alliedtelesis.co.nz/

All that patchset ends with an optimistic comment:
On Wed, 2020-03-04 Chris Packham wrote:
> I have had a reply from Marvell. They've contracted support for the old
> Cavium Octeon designs out to an external company. I'm not sure that
> means that we'll see some action on these drivers any time soon but at
> least they're doing something.

Now based on Marvell's 277 patches long set against 5.4.30 it seems that
'an external company' is Wipro and 'doing something' is the exact opposite
to 'make driver self-contained' as described in drivers/staging/octeon/TODO

That patchset contains dozen of *Sync-up-SE* patches which basically dumps
mainline changes and replaces platform files with the BSD licensed ones
common for Linux, U-Boot and Cavium tools. Ethernet driver is then synced
to that changes, making it even more dependent on arch/mips/cavium-octeon
code.

To fix staging driver to work with customer's CN7020 based board I'd had to
either go Marvell's direction or use DT for driver configuration, so I
partially did the latter. It is probably broken for anything else than
CN70XX and it breaks the ABI, newer kernel will not work with older
bindings. Is that okay for staging drivers? Does anyone even intend to
use mainline kernel with Octeon SoCs? Of course I'd be happy hearing
something changed at Marvell and they are willing to mainline support
for their MIPS based SoCs ;-)

	ladis
