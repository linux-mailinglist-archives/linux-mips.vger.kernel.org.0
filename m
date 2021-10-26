Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC0643AA26
	for <lists+linux-mips@lfdr.de>; Tue, 26 Oct 2021 04:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbhJZCSr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Oct 2021 22:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhJZCSq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Oct 2021 22:18:46 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77341C061745;
        Mon, 25 Oct 2021 19:16:23 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so17690403ott.2;
        Mon, 25 Oct 2021 19:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=A8iUif2eNgpHekuQNdE5AFgKQxCSdofHA4N+VETV+Y4=;
        b=CvStISCa6+AoSENJJEelhOiBpMDHCjsjRDIKukdc0bpGlztAi7lER2WEb/2XUcq8S3
         sbXt3b+WYAK0dpZx6H02ktt3ixbqOXgnb+071f4VuxHhohRkpv3d7d4Wfu2A8Wi5iZsl
         LHE0DXrpLl2+Y+/77h90uedAdyYd//sBNY73uVUk5r6XBPNEG/KNLr7F0jWPpclOmIBj
         JZGIENqn0jd09wudJNQwnV9w1jRtOUhY41IvZK0DoPmba9alg8HEMzLjUqWMtZ9Tswpv
         JQGwkyiUKgdloDRUTcTmMwc2OXGUDpVjNzpYA9emnOmgH/6DE5TCprqIucH577reHDGm
         astg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A8iUif2eNgpHekuQNdE5AFgKQxCSdofHA4N+VETV+Y4=;
        b=EA3hu6Phb0UIojv0gzB9h+MS8FoRUW5cPdcEdVlD8eMZPubF4oF4vZmH3lrFCDAmBS
         398yFrcWPytxC1LwEipYyULEpv+VfEVjn5LiCqcduPETljMS/tVo2Ofe+1f9jNwgfjO4
         W4mc7mzB0DKxay35St3bqtVlTfaqXlyz/FNw4lXPKmq8cECaSMvZezowHGJH2vSjOaDd
         J80l/6FpcgJo5qtKRNXXoDnoYo4fx9bh989cGVyK+gRKKug7RXlgnxM7POMDq0v5ssJ7
         +RCAqB0U/DCF4wHVuneiuis4Ol7/pwwACge1RiQt5peL89yeUOqNW5WoKQ59KZlLihoY
         V7zQ==
X-Gm-Message-State: AOAM5312DqHozIkaZ/cmdPr6uVzt0Ph57pUZFaSZCMoSUy4ncyaX98jh
        /CJnp2+hJu/cUufQFe6ZN0M=
X-Google-Smtp-Source: ABdhPJwrMTIesm818UJHjrNjNrfLB+it7usctWXzoRSP7UMMFPj7pUlTdQED6RdX56thGXcFtyVLvg==
X-Received: by 2002:a9d:60d9:: with SMTP id b25mr17104426otk.378.1635214582846;
        Mon, 25 Oct 2021 19:16:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1? ([2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1])
        by smtp.gmail.com with ESMTPSA id e9sm4061908otr.25.2021.10.25.19.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 19:16:22 -0700 (PDT)
Message-ID: <4a6a136b-9bbd-5703-9c8f-95ab1b9d64ec@gmail.com>
Date:   Mon, 25 Oct 2021 19:16:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/3] MIPS: loongson64: Drop call to irq_cpu_offline()
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20211021170414.3341522-1-maz@kernel.org>
 <20211021170414.3341522-2-maz@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211021170414.3341522-2-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 10/21/2021 10:04 AM, Marc Zyngier wrote:
> Also loongson64 calls irq_cpu_offline(), none of its interrupt
> controllers implement the .irq_cpu_offline callback.
> 
> It is thus obvious that this call only serves the dubious purpose
> of wasting precious CPU cycles by iterating over all interrupts.
> 
> Get rid of the call altogether.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
--
Florian
