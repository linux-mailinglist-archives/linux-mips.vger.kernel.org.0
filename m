Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2994E1219FA
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2019 20:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfLPTc1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Dec 2019 14:32:27 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34207 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfLPTc1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Dec 2019 14:32:27 -0500
Received: by mail-pl1-f194.google.com with SMTP id x17so4941010pln.1;
        Mon, 16 Dec 2019 11:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p1Dk/uxDRKui8W0LqfQ73djMdEqTqi9jnFoG51P1wjo=;
        b=EIuRnzritM3CMAC/FBFu5Twspg4VZcyD3egOunmKacKDYmNSWrhFPLPjxUzJ9FU1oK
         yd21YQvSz9c6TJz3Oq5m7Tr0rmgBwkW5UXHa6NBBR/KYcZW2Inhz/7kLcLdc0k18WErt
         H96mZbyVQJrMsianxLL6E1olmhYJ/IRJjJBHDDilGzRqiCadATRHqLbvwgSuwlbC4c5/
         PnRx8qJ+xhcPhjTJJlrR7Wu9LjIoR/PX9KWiaX+WuEYS8CbeSSr/X1pUfJKI7Rt2TwUg
         fArB1W+O3nGFRycEa2MLPFZPHG8OugbNTwjsAfftAmT56esX4EzjmjVDT+xoCgZ0iAx7
         NlQQ==
X-Gm-Message-State: APjAAAXQFB1gxHy95J+cGjYEAARp4NbOKoeoradfGzgwWk9zGDBNgCeG
        x9Bt/H9KEJy7f87DXkSWp38=
X-Google-Smtp-Source: APXvYqzWFpgda/n3hyW2AY7dDtew32u+Tc7ZMiV/e94JqghFfAk0nFmKw2E3vxCgqzXT4AwgnvCgSA==
X-Received: by 2002:a17:902:9b84:: with SMTP id y4mr17337869plp.13.1576524746306;
        Mon, 16 Dec 2019 11:32:26 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id e16sm22539831pff.181.2019.12.16.11.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 11:32:25 -0800 (PST)
Date:   Mon, 16 Dec 2019 11:33:33 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Guoyun Sun <sunguoyun@loongson.cn>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH V3] MIPS: Add get_thread_area syscall
Message-ID: <20191216193333.up4qqzxno23pbzix@lantea.localdomain>
References: <1576462671-7226-1-git-send-email-sunguoyun@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576462671-7226-1-git-send-email-sunguoyun@loongson.cn>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Guoyun,

On Mon, Dec 16, 2019 at 10:17:51AM +0800, Guoyun Sun wrote:
> CRIU(https://criu.org/) tools will dump TLS(Thread Local Storage) by
> get_thread_area during checkpoint and restore TLS by set_thread_area during
> restore. without this syscall, criu restore will fail on MIPS platform
> because a variable with GCC __thread will be invalid.
> 
> The following function will be called when criu restore
> 
> static inline void restore_tls(tls_t *ptls) {
>         asm volatile(
>                      "move $4, %0                                   \n"
>                      "li $2,  "__stringify(__NR_set_thread_area)"  \n"
>                      "syscall                                       \n"
>                      :
>                      : "r"(*ptls)
>                      : "$4","$2","memory");
> 
> the *ptls can be obtained by get_thread_area on MIPS platform when criu
> checkpoint. just like this:
> 
> static inline void arch_get_tls(tls_t *ptls)
> {
> 	asm volatile(
> 		     "move $4, %0				    \n"
> 		     "li $2,  "__stringify(__NR_get_thread_area)"  \n"
> 		     "syscall					    \n"
> 		     :
> 		     : "r"(ptls)
> 		     : "$4","$2","memory");
> 
> }

Why would you need a syscall for this?

Why not retrieve the value using the rdhwr instruction just like every
other bit of code using thread-local storage does?

ie. something like:

static inline void arch_get_tls(tls_t *ptls)
{
	asm("rdhwr %0, $29" : "=r"(*ptls));
}

Thanks,
    Paul
