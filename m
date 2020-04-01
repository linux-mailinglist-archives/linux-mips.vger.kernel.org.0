Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB5E19A96B
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 12:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732175AbgDAKUN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 06:20:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44102 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731839AbgDAKUN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 06:20:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id p14so25158059lji.11
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2020 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ENHstGjuwW2yo3COsGAECyjpxrxaSoZPQXrr2CDIHqY=;
        b=ktrc8MpUEQ5QI60gYoRyEuvXwXfpEqx3M/fJrox89MhNAHgYG86XLaLOivQ4eQVGSK
         G89OY/Z844A8pm6YBWQeSS0CI0luQUhL0yFIhrDRDU5jwFln6jdw3yd593tYuFNvpFFy
         0Fq7m8s9XhFlbYHxrtmek5bt2Xh4APWdRr1dgaqv5KSP94GHOm7PRhJlpzgD6CXET2GK
         Oa3eVgsfIYfPHmP+KqTY9XrTNUYqMf1lNt5eWOT/gT8/2zATPWyIhGwf3GLewEcss9qg
         9AOKRvdVO/l5lA9eo+oCI4YtDu8dguLTOWS8IF6jTn5KrGbNF7S+8G2s8syNS+unUgSr
         24UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ENHstGjuwW2yo3COsGAECyjpxrxaSoZPQXrr2CDIHqY=;
        b=XGn3YWYv3bbCAxYtwDe3zTJ/Hs4WxsmF7l1qzUXdpT9GBbgH2z7UeK+qkTjQBV+DSE
         Y2Ll6mWaP7H+gPyas+IkTfj203cDWLYVn0FwVmkyUTm1WRXuo6PGURTmA3W6R6CPcnV/
         2lo1q8sx9m2LIpPnc9JUjQwnkar8h84HQIcQt9aXC4tRUw03M/Sr4l+Tb7gB8u6Y54am
         GUvM+5+erL/qNk9wLpIZsKxN9Yl0ZumdxL7+I3nqO9y7jiZeFLRN4r1/8IHFsFB0h4pO
         WZ8I6y5tIS5s1TINDq63JKCQ7Z+d7DPaacgBxk1sBPXuoq5rWs9mLtFisGX52thBXF5T
         R34w==
X-Gm-Message-State: AGi0PuY9dLEitcyO76VMJOJQCbDLt0UR42lLTDNnKHXLK7aHi42ofrBM
        O/B8pxkvNG/oIY9tO8Xuzkz0Vw==
X-Google-Smtp-Source: APiQypL9WDxbsq4oYKXr36Yb9n5DZ8OQKZ64pbm4DDxE1ew8kCL3RjSimoOmg9MTrlry5TTqx+bKuQ==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr12504657ljj.272.1585736411428;
        Wed, 01 Apr 2020 03:20:11 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:245:3fc8:782f:cdd9:3f89:e462? ([2a00:1fa0:245:3fc8:782f:cdd9:3f89:e462])
        by smtp.gmail.com with ESMTPSA id u30sm1307508lfn.2.2020.04.01.03.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 03:20:10 -0700 (PDT)
Subject: Re: [PATCH] KVM: MIPS: fix compilation
To:     Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, peterx@redhat.com, rppt@linux.ibm.com
References: <20200331154749.5457-1-pbonzini@redhat.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b2689d50-f5fe-c7ba-eede-f11920f1d012@cogentembedded.com>
Date:   Wed, 1 Apr 2020 13:20:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331154749.5457-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 31.03.2020 18:47, Paolo Bonzini wrote:

> Commit 31168f033e37 is correct that pud_index() & __pud_offset() are the same

    You should also specify the commit's 1-line summary enclosed in ("").

> when pud_index() is actually provided, however it does not take into account
> the __PAGETABLE_PUD_FOLDED case.  Provide kvm_pud_index so that MIPS KVM
> compiles.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[...]

MBR, Sergei
