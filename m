Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18939192EEB
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 18:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbgCYRKA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 13:10:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:29004 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727320AbgCYRJ7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 13:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585156199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vevCBANHYn2Lnc4NylQjd/uYKWuxOb7yWJMgri8X8CA=;
        b=ASVxzbOLz5fxrVVal2rz1GC4mVPygtM3hT42PS3M8d0fJigej6hFmatNnoyxFl05t1WvUd
        whgJLid3UAS7Rg7zPkW5wtSIHsvXyjrQh3CfppbUURyrxP/Ui2gwcMA/8W/N8TJLVXxgvo
        CzMMB5l7zf+PLj/M2Tnbn7Jxx2b6Bs8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-2m7YL3zVPwitKP_AmjV8pA-1; Wed, 25 Mar 2020 13:09:57 -0400
X-MC-Unique: 2m7YL3zVPwitKP_AmjV8pA-1
Received: by mail-wm1-f72.google.com with SMTP id m4so1126085wmi.5
        for <linux-mips@vger.kernel.org>; Wed, 25 Mar 2020 10:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vevCBANHYn2Lnc4NylQjd/uYKWuxOb7yWJMgri8X8CA=;
        b=P109CeVLiHgTjgrS3YX66Wi87mq0v+twEg+v9eJr+46ex5EGuBin88tbnicGOv+DCr
         kRpagPVmp7acVYm21ORff0ls0f6CrtUYj3QZ5PsMdSjETc2shcHgjoo4Ql+ua3MRtjp7
         VWdXI8jCDFK//MMnzC0WIW7VqrZt39f7jL/3lblADDK50fXB/3cmuV3cOHUNgglB9/Sr
         2gez3wSUCwUber3ztc/hCPUwIynognfU/9FRLH6CHnHD2cqgj7yBeHQnP23/1jmxIatk
         4VaWBNpKD2SeD1Ytc/RNYtGmK6xjZflOOv8Vh5beYiLURY9AIVv9nAY2s+VG+tL9Yl6k
         g9nQ==
X-Gm-Message-State: ANhLgQ0sN2+yHgWnnMyVXh0u/CQzUnFfLt2jikLJPjtpCKHAqFv373TK
        2fy0PtuK+1jNE2mWtBQdAaosT1uyqE2toxHks1k5s3pIsFk5ZSM+lJRqN0IrJkMwly/mg79jnOP
        2lb4icdu3vCgMqJdHr889yA==
X-Received: by 2002:a1c:ab54:: with SMTP id u81mr4174245wme.166.1585156195993;
        Wed, 25 Mar 2020 10:09:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsDeuPAf6z2VeRFRt7ZJYFWF9FC4OwqXVMD3tFXVyspIst/9JsJ8aRkJ29STSyG+27J7ShG6g==
X-Received: by 2002:a1c:ab54:: with SMTP id u81mr4174213wme.166.1585156195636;
        Wed, 25 Mar 2020 10:09:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e4f4:3c00:2b79:d6dc? ([2001:b07:6468:f312:e4f4:3c00:2b79:d6dc])
        by smtp.gmail.com with ESMTPSA id q8sm35205395wrc.8.2020.03.25.10.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 10:09:54 -0700 (PDT)
Subject: Re: [PATCH 3/4] kvm: Replace vcpu->swait with rcuwait
To:     Davidlohr Bueso <dave@stgolabs.net>, tglx@linutronix.de
Cc:     bigeasy@linutronix.de, peterz@infradead.org, rostedt@goodmis.org,
        torvalds@linux-foundation.org, will@kernel.org,
        joel@joelfernandes.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        Davidlohr Bueso <dbueso@suse.de>
References: <20200324044453.15733-1-dave@stgolabs.net>
 <20200324044453.15733-4-dave@stgolabs.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6b23828-aa50-bea0-1d2d-03e2871239d4@redhat.com>
Date:   Wed, 25 Mar 2020 18:09:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324044453.15733-4-dave@stgolabs.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/03/20 05:44, Davidlohr Bueso wrote:
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 71244bf87c3a..e049fcb3dffb 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -290,8 +290,7 @@ static enum hrtimer_restart kvm_mips_comparecount_wakeup(struct hrtimer *timer)
>  	kvm_mips_callbacks->queue_timer_int(vcpu);
>  
>  	vcpu->arch.wait = 0;
> -	if (swq_has_sleeper(&vcpu->wq))
> -		swake_up_one(&vcpu->wq);
> +	rcuwait_wake_up(&vcpu->wait)

This is missing a semicolon.  (KVM MIPS is known not to compile and will
be changed to "depends on BROKEN" in 5.7).

Paolo

>  	return kvm_mips_count_timeout(vcpu);

