Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9483A5F6C
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 11:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbhFNJxb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 05:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57361 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232797AbhFNJx3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Jun 2021 05:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623664286;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yVGqXIcKrLCK11mCl5CKOO3c7mK+et1d86zdU/of4sY=;
        b=Jb5JdD8X/xF0x/6xn+VQj7HDjgkfSpyZXv+u8LxkZZRpkqK8QiJbszXNbbqmytvJUswjQs
        Wnh3v1wG7WdNrqW3OaEz5NFOC+Kgg9a4MAO1oogYDNpFmeHbbOrpK2aN02aRyD1pBINXUw
        dM7asWdPEOMhXzzu0G0sEYa0G83cYJ4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-iaxKVsVsOLaowOs5kHp7JA-1; Mon, 14 Jun 2021 05:51:24 -0400
X-MC-Unique: iaxKVsVsOLaowOs5kHp7JA-1
Received: by mail-ej1-f69.google.com with SMTP id e11-20020a170906080bb02903f9c27ad9f5so2822356ejd.6
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 02:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yVGqXIcKrLCK11mCl5CKOO3c7mK+et1d86zdU/of4sY=;
        b=QwsRVLil27fPa3aTbit9d8Jax334eCeucAVH2n8NDT4ljbP81Qf+XZyIUaDIFaz3wI
         u6WDbcvutTuutJGH+u2vYRi9Ad7Mb/gDXgeqeWIQF1sgKKxgVW52BF3UWVJqhbQaPtcW
         IDwUU2SqHKtUQQLZUB/2LbUbS4hG4tXTgwy9/5/meMQWpBl2LZXoy1SEBSFu82AlA+J0
         8ftyVSxkTxmS3Q5FM/iE0jUcQsD/qYib2U9w2rbwjUEvQ9h3qV5Flgkd36q8969K1KZ5
         6nfUi8NfMxbNgMkT9kXAT+aAAkSaj7e0uaINK+aeatmcRwt/cLt+ABEDjAjGNLm8sY1K
         Xh+w==
X-Gm-Message-State: AOAM532he3umkzi6Jo5cKkSvTvAdXkpDFjuyo38n5Se5SCQSJnGMO3ZT
        dWzslg0iSjRcfdACRLImENi00AEg1bioGHSHnsdx6dJE6S+2efsXFScVOeZ1+Lk/m6HAsDAiY08
        nzrGFKRL/fbVPo6RlJzA+KA==
X-Received: by 2002:a17:906:606:: with SMTP id s6mr14277121ejb.206.1623664283796;
        Mon, 14 Jun 2021 02:51:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUGdB6YCrtVUeX6wpPs0U6HuF+wRnjGRZ9weZzhvjGvM0kMMRuORQ5jQGRt+viUDl0Dzm5nQ==
X-Received: by 2002:a17:906:606:: with SMTP id s6mr14277110ejb.206.1623664283633;
        Mon, 14 Jun 2021 02:51:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y15sm8131933edd.55.2021.06.14.02.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 02:51:22 -0700 (PDT)
Subject: Re: [PATCH 2/4] KVM: stats: Use binary stats descriptors for debugfs
 interface
To:     Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
        KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Fuad Tabba <tabba@google.com>
References: <20210614025351.365284-1-jingzhangos@google.com>
 <20210614025351.365284-3-jingzhangos@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1b57502b-116a-9be5-fa2f-1e8f5b5fce2d@redhat.com>
Date:   Mon, 14 Jun 2021 11:51:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614025351.365284-3-jingzhangos@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/06/21 04:53, Jing Zhang wrote:
> +	STATS_DESC_ICOUNTER_RONLY(VM, lpages),
> +	STATS_DESC_ICOUNTER_RONLY(VM, nx_lpage_splits),
>  	STATS_DESC_ICOUNTER(VM, max_mmu_page_hash_collisions)

I think we're now adding too many macros.

max_mmu_page_hash_collisions is the only remaining instant counter that 
is not read-only.  In fact, in the statsfs prototype we made all instant 
counters read-only.

You could add a third type in addition to instant and cumulative, let's 
call it "peak".  This essentially corresponds to the "max" aggregation 
function in the statsfs prototype.  Then instant counters would be read 
only, while cumulative and peak would be read-write.

Paolo

