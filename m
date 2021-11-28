Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C406460432
	for <lists+linux-mips@lfdr.de>; Sun, 28 Nov 2021 06:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhK1FPO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Nov 2021 00:15:14 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:13421 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhK1FNN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 28 Nov 2021 00:13:13 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1xPH1FPPz4f;
        Sun, 28 Nov 2021 06:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1638076195; bh=oUZYFQUmcrcLe+khMfxoyii9jHAFHFy8/qX4bg6ScHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JnSDJhb2/wFE1+K5BEKj3l92hAUJYMSiQfvzp+ZlCATcD11ALuloHBV8agVwt/D5m
         6xO5KVkS6ds9BhnvUIzgpE+GOAlwIHTeHWZUDQLRlCqXrEtKOnOW/XLCrUHjRtkpA+
         s0Zgh/IC7vC3LAsHBRaM+HBKV7zFjzE+7UOTFGbokGiHbpHQX7rXsKsJST3S+JBeda
         2sNRV1hDCglR6IzM+jk8O4GqGLON53RjQjMI9dzQcjIf9OmuQDCgevPa74eYKb6N8i
         DO41zxtTZnaEDqhBVPy9rAwcuQc/n0JQGJK3acFZNX84ZqpVMLYjA4M2TxieYk4Vj5
         b6s4KzCtg6yrQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date:   Sun, 28 Nov 2021 06:09:53 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Yury Norov <yury.norov@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <YaMPIXUYuP1Q5FrQ@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 28, 2021 at 05:56:51AM +0100, Micha� Miros�aw wrote:
> On Sat, Nov 27, 2021 at 07:57:02PM -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpus()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> [...]
> > @@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
> >  
> >  	/* allocate pages */
> >  	j = 0;
> > -	for (unit = 0; unit < num_possible_cpus(); unit++) {
> > +	for (unit = 0; num_possible_cpus_gt(unit); unit++) {
> 
> This looks dubious. The old version I could hope the compiler would call
> num_possible_cpus() only once if it's marked const or pure, but the
> alternative is going to count the bits every time making this a guaranteed
> O(n^2) even though the bitmap doesn't change.

Hmm. This code already unnecessarily calls num_possible_cpus() multiple
times. Since it doesn't change after early init I would suggest just
calling it once here.

Best Regards
Micha��Miros�aw
