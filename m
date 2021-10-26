Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303CB43AA63
	for <lists+linux-mips@lfdr.de>; Tue, 26 Oct 2021 04:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbhJZCni (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 22:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234320AbhJZCnf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Oct 2021 22:43:35 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E48C061745;
        Mon, 25 Oct 2021 19:41:11 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id d20so3568023qvm.4;
        Mon, 25 Oct 2021 19:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=olfw8MNAxV9RiRyvuemdxMNUZP8mSE+fs0tsZ8n0qPM=;
        b=YA5WvYmAQhn/0pKAze8tjs/siZkxdq2ZfMSjjCFdDX7nEFW+ENuEOkP85T5RGZDaYS
         MSNsvnEvUCrUVdUgm+Pe9Zms3j95F2aFlJC0aWzlEqYD2M6fLjnlWu4wKbmAJ1zq6Lo+
         c6ESl49xAD4d0E6gw5xhyZgsgYYuqMLeVdli0C7YbYgRz3t7C4nuaHNzOIaAXrlwBrRT
         fSyIyir1Fk8F5pijI1Qy+rryPvChqqKA5cQ1eUAQxV8nb0E+YE/uRtvPstvrnLAyHpwx
         mf0RhmDwaD771dWVAqlB6I/RRH+fqAs3IFNeMQNa7SN01T5AK6aSkoF3RV68fElowlzM
         xZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=olfw8MNAxV9RiRyvuemdxMNUZP8mSE+fs0tsZ8n0qPM=;
        b=ao6kLSS+c+jff0pBVkjPGwy88PLogNL4TXRw2SY89yu3QywnicdrNyDv2uPY7agP1g
         rKdnfAmbG+ps9D6phi11ewT/5kIq7udscTvmrZk9Sxiovlgw2L9Go6cyY9bDrGyc88V8
         4o8EDjrxkVV3570Q09NhPf9Q6YAQrjeQoNG24tzHO6YWnP8KguTnkP0OOnUkazi0kng8
         seOkB3dKtQ76ylp906tm/VoKiwQ09hsHqKySMI73PJrdhLNbwITaA/71KQ534gppB5J1
         2/kfE33u4QaeE7dVJVsEFi9Oq1VioZpQ/y9ymznMNgaSXQ1SRgWQY/j9PY4vApgnBwi8
         yaUw==
X-Gm-Message-State: AOAM532qqST0Una9jfU/K2g9GG8eHKK75SpxOjYV5aX1dbgrtr6oYElq
        xpxDkNIOYKgfX5/ZL3uOYxs=
X-Google-Smtp-Source: ABdhPJzB4jzQ5Q8eV7KGcnpT5+B6qtzxijfQQmTzr6q8HUPV8PhQFzrquV1D7WEttQ0TMPfK3v2fhQ==
X-Received: by 2002:ad4:5188:: with SMTP id b8mr29984qvp.24.1635216071052;
        Mon, 25 Oct 2021 19:41:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1? ([2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1])
        by smtp.gmail.com with ESMTPSA id b13sm9572169qtq.69.2021.10.25.19.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 19:41:10 -0700 (PDT)
Message-ID: <d5152935-bab1-314c-baf3-3e623882dc3a@gmail.com>
Date:   Mon, 25 Oct 2021 19:41:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 3/3] genirq: Hide irq_cpu_{on,off}line() behind a
 deprecated option
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20211021170414.3341522-1-maz@kernel.org>
 <20211021170414.3341522-4-maz@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211021170414.3341522-4-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/21/2021 10:04 AM, Marc Zyngier wrote:
> irq_cpu_{on,off}line() are now only used by the Octeon platform.
> Make their use conditional on this plaform being enabled, and
> otherwise hidden away.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
