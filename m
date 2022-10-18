Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E512A6028D3
	for <lists+linux-mips@lfdr.de>; Tue, 18 Oct 2022 11:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiJRJ4B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Oct 2022 05:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiJRJz7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Oct 2022 05:55:59 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8819B14E6;
        Tue, 18 Oct 2022 02:55:57 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 749F9240010;
        Tue, 18 Oct 2022 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1666086956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GMcXIkL+nvRSGz9bJcoeIxWVctnTAOc43A22A4uBfDc=;
        b=hGtr3RmGXUOTWNJnsTlSAnrlwI1g2/ziwgCBu48BF9TX1LSiY3B8/Kc85ZR+kmZkx6OEZo
        0RIvhz3wy09RC4ufLYCnc3MkQnqhh4f5Iq/QK6DB01+EEDnkaR7qI9rIifXnDBbW0umMav
        xU/9o2sCrd21/7wOKuTLEXJNZjJShSwGC16gihHfg1XUxKgP/rXVMO89Ggzji9LAewdymB
        ExgO1TlKUaOnztGhNMErVMv/nWW3TSJ395ftwNa/NTh9yUjahmUvFfHz5mq4KFmMJYw6Ul
        kd7mqSel48md0rACsrUVqzXafLO0a0FUkHUJiIcu5+0fT6jy11dnWGJ66e/4tQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        John Crispin <john@phrozen.org>,
        =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 2/2] mtd: parsers: add TP-Link SafeLoader partitions table parser
Date:   Tue, 18 Oct 2022 11:55:48 +0200
Message-Id: <20221018095548.542866-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015092950.27467-2-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'aec4d5f5ffd0f0092bd9dc21ea90e0bc237d4b74'
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 2022-10-15 at 09:29:50 UTC, =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This parser deals with most TP-Link home routers. It reads info about
> partitions and registers them in the MTD subsystem.
> 
> Example from TP-Link Archer C5 V2:
> 
> spi-nor spi0.0: s25fl128s1 (16384 Kbytes)
> 15 tplink-safeloader partitions found on MTD device spi0.0
> Creating 15 MTD partitions on "spi0.0":
> 0x000000000000-0x000000040000 : "fs-uboot"
> 0x000000040000-0x000000440000 : "os-image"
> 0x000000440000-0x000000e40000 : "rootfs"
> 0x000000e40000-0x000000e40200 : "default-mac"
> 0x000000e40200-0x000000e40400 : "pin"
> 0x000000e40400-0x000000e40600 : "product-info"
> 0x000000e50000-0x000000e60000 : "partition-table"
> 0x000000e60000-0x000000e60200 : "soft-version"
> 0x000000e61000-0x000000e70000 : "support-list"
> 0x000000e70000-0x000000e80000 : "profile"
> 0x000000e80000-0x000000e90000 : "default-config"
> 0x000000e90000-0x000000ee0000 : "user-config"
> 0x000000ee0000-0x000000fe0000 : "log"
> 0x000000fe0000-0x000000ff0000 : "radio_bk"
> 0x000000ff0000-0x000001000000 : "radio"
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
