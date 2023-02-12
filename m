Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AFDB693711
	for <lists+linux-mips@lfdr.de>; Sun, 12 Feb 2023 12:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBLLtW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Feb 2023 06:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjBLLtV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Feb 2023 06:49:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A4610241;
        Sun, 12 Feb 2023 03:49:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DC6B3B80CBF;
        Sun, 12 Feb 2023 11:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899CDC433D2;
        Sun, 12 Feb 2023 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676202557;
        bh=U5CRW6ntg+rwUZ2JHX3a9tmSdJfG2KOzOF1UjywesfY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Fa2f60aAdqzcy50hdg7nD+p9Bfs78WrXtLwLJPZEOaQWB+ayzcuLsl2d+f+qQIy08
         sqxVhg5C7/OTskfHW7wnkOVjJIriCqjnuNCCZ2qP6d0QH7YL2eNwtoIgtT5BHlEQro
         sWQe1BZajY2yHNmLTwSrp2sgN6HyCO8020dpxgTKw4kz6VnxzFHpV+sT1nVlUqKW5A
         U0KhssDKnEmTo+AG5KqynhkbWoGEbDMXIsSGm3M3NUTJEy4jnHQmvIk+LIiVzZ0cL1
         w27gphqPjy7oxByNPLkryLlf+ZIFxg1xFadIosVVrqghKPMVRGYLRwMdp0pZcTy/XD
         a6oFXxplaX6kw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1pRAr5-009ie6-9p;
        Sun, 12 Feb 2023 11:49:15 +0000
Date:   Sun, 12 Feb 2023 11:49:09 +0000
Message-ID: <87lel3kssq.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] irqchip/loongson-eiointc: Add DT init support
In-Reply-To: <20230211024156.3530526-1-zhoubinbin@loongson.cn>
References: <20230211024156.3530526-1-zhoubinbin@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: zhoubinbin@loongson.cn, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, tglx@linutronix.de, lvjianmin@loongson.cn, chenhuacai@loongson.cn, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 11 Feb 2023 02:41:56 +0000,
Binbin Zhou <zhoubinbin@loongson.cn> wrote:
> 
> Add DT support for EIOINTC irqchip, which is needed for the Loongson-2K
> series, e.g. Loongson-2K500 soc.

Where is the binding? I'm pretty sure other drivers need updating.
Where are they?

	M.

-- 
Without deviation from the norm, progress is not possible.
