Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C663222025
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgGPKCF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:02:05 -0400
Received: from elvis.franken.de ([193.175.24.41]:38190 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgGPKB6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:58 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iA-0008Mc-00; Thu, 16 Jul 2020 12:01:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 66B5CC07DD; Thu, 16 Jul 2020 11:39:40 +0200 (CEST)
Date:   Thu, 16 Jul 2020 11:39:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: Add YLM
Message-ID: <20200716093940.GA8455@alpha.franken.de>
References: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623182432.187843-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 23, 2020 at 08:24:26PM +0200, Paul Cercueil wrote:
> Shenzhen Yangliming Electronic Technology Co., Ltd., abbreviated YLM or
> YLMChina, and known as Anbernic in the rest of the world, is a Chinese
> manufacturer of handheld game consoles, some of which are known to be
> running Linux.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
