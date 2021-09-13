Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39184098EF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Sep 2021 18:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbhIMQZd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Sep 2021 12:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbhIMQZc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Sep 2021 12:25:32 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6FDC061760
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 09:24:16 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t20so6716720pju.5
        for <linux-mips@vger.kernel.org>; Mon, 13 Sep 2021 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q0CGByNGBLX5VAdHy/UUqDDhbh6zFNghWMoOnFHZGGw=;
        b=RKVTfzY0+sEOlHZwMw4vPz+GvPXyX750p2mC7wWOXKxWfCoapA8MjCsz6G9dj02/wG
         B3XA0COQxzdKlQnGZdkEIklM+WI1cCOz+NXBUmQAkuk6QYoRk2zuC5o5qdb+Waer+AG6
         OJfpQmWIx+uSLeokuBis+oQjVfX0ehooADGOWTQJL7kvEiY2whnhENiIBsCY1yS7miFs
         eIwDCSG3arqEXzSdyaQ8k4NCpo1gSL9V/1EeiI4I0/s0VJZhs1z0e/EcQVIbBvac32A4
         s/tiDk2BF9PVxJ1n8cTLxrdDzppZo/ZkmBIG/TmGcUI4PbafbQvkNhTqwB0iH4JdKWBE
         B1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q0CGByNGBLX5VAdHy/UUqDDhbh6zFNghWMoOnFHZGGw=;
        b=us0JwAejAvBZpM/iRv952HDHz0w1I31t1n6D2umA/g48atWYxZo7d4GBvMkTlF4PBo
         RZDAKTN5/ZAWh6T/upDEYgwZH+yvWWoIlsvqXQqEcLeOxc9VMPXr2r/bOk0LzgIHlWCU
         HQlo/ZclA2eJKpQqOw1E7+qHWOaU4uOzqcWuQFVDytfab6iXeZxavLfc5IMBmHMrYegG
         rMn2TzzUIgOw+Wb0pKoJ6fm56jaiPNEIYc920jA6XR9B+Lmf8+AQa6Ry4L8fOBVCkajv
         Br2kjHZ+2nV7OMeM5uGpIze2h+FbicKjkdkrVm0WfYKvH8H6CrpKIUAw30ZpB/TLcZjF
         RCWw==
X-Gm-Message-State: AOAM531dMmgBNDzQKqfWE/ESk1ukD5pkLmJ5ZMsOOXy8RgzvCupLsbIc
        Ih8iRmO/6AxEJ7CK71/EVTiCOA==
X-Google-Smtp-Source: ABdhPJxf1CW8M7Ti4tr+U9bXba0ZjdRcakxdnIlaD1AcyqYZi788mkJc1rFObUJoedvExK8OgSG5Tw==
X-Received: by 2002:a17:902:c94f:b0:13b:8359:9506 with SMTP id i15-20020a170902c94f00b0013b83599506mr9519028pla.33.1631550255767;
        Mon, 13 Sep 2021 09:24:15 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id b16sm7768188pfr.138.2021.09.13.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:24:15 -0700 (PDT)
Date:   Mon, 13 Sep 2021 16:24:11 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Juergen Gross <jgross@suse.com>
Cc:     kvm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 2/2] kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
Message-ID: <YT97K7yXyCrphyCt@google.com>
References: <20210913135745.13944-1-jgross@suse.com>
 <20210913135745.13944-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913135745.13944-3-jgross@suse.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 13, 2021, Juergen Gross wrote:
> KVM_MAX_VCPU_ID is not specifying the highest allowed vcpu-id, but the
> number of allowed vcpu-ids. This has already led to confusion, so
> rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS to make its semantics more
> clear

My hesitation with this rename is that the max _number_ of IDs is not the same
thing as the max allowed ID.  E.g. on x86, given a capability that enumerates the
max number of IDs, I would expect to be able to create vCPUs with arbitrary 32-bit
x2APIC IDs so long as the total number of IDs is below the max.
