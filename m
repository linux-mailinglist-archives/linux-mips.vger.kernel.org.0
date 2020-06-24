Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CF5206EF6
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 10:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbgFXIaH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 04:30:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387686AbgFXIaH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 04:30:07 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD2DF20823;
        Wed, 24 Jun 2020 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592987407;
        bh=ujlYvGc1lf5tVmC0czUM70uo/f/lTgG6Gy7yAiHHdD4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ws1TEyeGGmgLI3i3DRo+nTQvcgjG8YgfgAafXZ5fHbg83yX/cB5IZ2SZaUa09T7i4
         g+8msRu7C4wVxLjUwnvs2rZO4NwHLvKWdmVYJWu7+kFy9K+FmjmSCcTUE91pWH2WtV
         HCvHcSzPz6pzkhRxDcA67tYZLe8QD5Srv4gkOI5A=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jo0nF-005zwW-Ec; Wed, 24 Jun 2020 09:30:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Jun 2020 09:30:05 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 00/14 RESEND] irqchip: Fix potential resource leaks
In-Reply-To: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <e419a2acea6c1977eaef5d049d607749@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: yangtiezhu@loongson.cn, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, lixuefeng@loongson.cn
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-06-24 08:44, Tiezhu Yang wrote:
> [git send-email failed due to too many commands,
>  so only cc the major related email and resend it,
>  sorry for that]

This is becoming majorly annoying. Please fix your git setup
*before* dumping 57 emails for just 14 patches. You have done
the same thing yesterday, and I would hope you learned from your
mistakes.

Also, do not repost a series more than once per week. You have
already exceeded your quota by quite a margin.

         M.
-- 
Jazz is not dead. It just smells funny...
