Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3943231F22
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 15:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgG2NTr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 09:19:47 -0400
Received: from [115.28.160.31] ([115.28.160.31]:44526 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726353AbgG2NTq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jul 2020 09:19:46 -0400
Received: from hanazono.local (unknown [116.236.177.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6496560161;
        Wed, 29 Jul 2020 21:19:41 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1596028781; bh=W6bm5VJC3uYl2a2NIj35azxKZiY1JY/4cXh9ZnTkSyg=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=aemjsakFISLW8lz/VrQe97XroXZUuDKa3sINDWk1qaZUkBGQNZp+EuPy+wBuOZh+p
         ejoCY4sqYp7ihtZ1XaLnjKawHlRoZGixPK3Ze4tdx3nySimeFCvLCjCMyMrw11Ezxa
         XWSxHuCINWWJ2wJucWNYdsiRwpfeOLnWUF1vV6w4=
Subject: Re: [PATCH v5 0/3] Refactor FTLBPar exception handling and add GSExc
 handler
To:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
References: <20200729131417.4000213-1-git@xen0n.name>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <acd7799f-9d15-067c-cbcd-e425d3ecdda6@xen0n.name>
Date:   Wed, 29 Jul 2020 21:19:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:81.0)
 Gecko/20100101 Thunderbird/81.0a1
MIME-Version: 1.0
In-Reply-To: <20200729131417.4000213-1-git@xen0n.name>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/7/29 21:14, WANG Xuerui wrote:

> [snip]
>
> v5:
> - Fixed broken build on pre-MIPS32 configs where mfc0 can't have
>   selector, pointed out by Thomas. Build-tested ip22_defconfig.

I accidentally left stray files in git send-email directory, and sent
the cover letter twice. This mail lacked the second change entry for v5,
please see the another cover letter. Sorry for the noise.

