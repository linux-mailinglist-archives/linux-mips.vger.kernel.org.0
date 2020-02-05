Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7C41532DE
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 15:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgBEOaL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Feb 2020 09:30:11 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42706 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726413AbgBEOaL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 09:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580913010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RcBQTT6GLODG/bayLzSATYtu3RyNvIBwuV6XGUJB/88=;
        b=QeEW+fHIA4LdgKmHHqyhAjfBicIQoRVpnW6cCnAz57tIcEgFKdCSgOlcCHr97H5/T1bVbl
        ZsZrZ+UFqHgKzO/IaP0thdh6zzjr7L4uWLrCXLbrFb05YSvFLu1wXsd0bnUYHYr+4EOtfZ
        KoiIaglefNrqn9aFAIZ+p9MaCRQ69eY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-ea9q7dOVMaydPRBHX97ong-1; Wed, 05 Feb 2020 09:30:08 -0500
X-MC-Unique: ea9q7dOVMaydPRBHX97ong-1
Received: by mail-wr1-f71.google.com with SMTP id v17so1252431wrm.17
        for <linux-mips@vger.kernel.org>; Wed, 05 Feb 2020 06:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RcBQTT6GLODG/bayLzSATYtu3RyNvIBwuV6XGUJB/88=;
        b=H45UXxEWJl6JkXdIMwfFgn+s3tlCAVQumcEh4bc+iA+so/UDcUvk9Fyl2vXcMlpFZw
         Go2m8hRgCPFFgQVbNiJ9sZjSKsrs28a/5/9ndAIEMQBh2SxzAmNiarG0Bff/K9+Ys8hx
         jeIzVWiNekZqACynaLI20uX51AbNPZuQskDI+bG9nON0L3o6xctMEt2MnZ7hjEowh4mD
         SfI9/AfFg6yocp8HxGbpmA//HA9Zr/cPmg7UrRDYqnSw5ARw/r/pfhy1tQ/l1uocf1uB
         6dYW41cmaO8o0zTv5Mq+6NZdzho2GT3Sl07vWRAg/ZzwSofi5baQTjzFH2Hpg2vfHbjP
         sBkw==
X-Gm-Message-State: APjAAAVpLPhNQGBMoRa4DiWUES140hV3beBWM9pctACk1LyAfdptgo1t
        H45buzA7ZXvsZXVRhFvPKh4x92SBj/3nTL6A++tGhtfk+v8QGjOwRqfbwetmZXN73t0baSJdw5z
        VlXnn9BzztuE4uu8EZGMWmw==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr28458455wru.173.1580913007777;
        Wed, 05 Feb 2020 06:30:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPyNlBB+QY4QitNu3rZNQx8P+4lrTaxsMdCLh9PQg7zNm4xD+igmbXS51wFovwRHZ40ooAKQ==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr28458439wru.173.1580913007609;
        Wed, 05 Feb 2020 06:30:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56? ([2001:b07:6468:f312:a9f0:cbc3:a8a6:fc56])
        by smtp.gmail.com with ESMTPSA id v14sm16285wrm.28.2020.02.05.06.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 06:30:07 -0800 (PST)
Subject: Re: [PATCH 0/2] KVM: MIPS: Bug fix and cleanup
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Davidlohr Bueso <dbueso@suse.de>
References: <20200203184200.23585-1-sean.j.christopherson@intel.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2b35c83d-07ed-00da-9fcf-d0d5594a1310@redhat.com>
Date:   Wed, 5 Feb 2020 15:30:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200203184200.23585-1-sean.j.christopherson@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/02/20 19:41, Sean Christopherson wrote:
> Fix for a compilation error introduced by the vCPU create refactoring, and
> a patch on top to cleanup some ugliness in the relocated code.
> 
> Untested, really need to setup a cross-compiling environment...
> 
> Sean Christopherson (2):
>   KVM: MIPS: Fix a build error due to referencing not-yet-defined
>     function
>   KVM: MIPS: Fold comparecount_func() into comparecount_wakeup()
> 
>  arch/mips/kvm/mips.c | 37 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 21 deletions(-)
> 

Queued, thanks.

Paolo

