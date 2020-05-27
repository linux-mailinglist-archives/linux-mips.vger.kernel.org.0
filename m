Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B701E50A1
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 23:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgE0Voz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 17:44:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43042 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725940AbgE0Voy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 17:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590615892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fBvAWYmBdzgrA5U0LT3xtBczNhEDcnN6W5IKb+q9W/4=;
        b=QEqoUDlIvmI2hBiD4wCZGEVXSoFKikYClEgisZAokONZIGycxBOUcu9FhKgkp0XiC4dDmA
        +/5YHL25q8RLW57uN5cwLoa7ALTzjPHsZ8V2MygNEyWV73VLQc1JG3/gB058ZGMP6AkqPA
        FJaPGnugxh9r1/I3f0eVuB7jOckuwHw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-jaPnZSbGPcSGRSNJzYjCPw-1; Wed, 27 May 2020 17:44:49 -0400
X-MC-Unique: jaPnZSbGPcSGRSNJzYjCPw-1
Received: by mail-wm1-f70.google.com with SMTP id t62so264963wmt.7
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 14:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fBvAWYmBdzgrA5U0LT3xtBczNhEDcnN6W5IKb+q9W/4=;
        b=ZETV5QNJNMStxN1TGOnnq2IrzwgmaD+dK97mJzErs6uTBElXQCdDRctxfewhXbXPEZ
         AAiZDeGBeP1QHGANKAETvb/jcxXxnXzmmYav8mxeUJmpE8ML9h/t451fbC9n+2ZCMRIi
         n3YZEXG855TDiFAomaUGa5uQPHKju8XjvOZy/nONEVR/zpG4pfhy3BLVPb/u+bDWh6vA
         P3R4WT5nPyQpYpP5G0HwhJqkEo/khACSzZjmMjfwnFZ/YKycOog2a7F25nyJr6qRun1D
         jvNdb/oUJo9+8gJZ9kPba+55G1DJX2K3YA9y2kv4nrmf/8yi7sClK15pmGHjEPXY0+Vm
         rxmQ==
X-Gm-Message-State: AOAM530qfVZe5j+XjXLTEdE9xa5LTLq4qyX8nXgD9+uAxnvx/Bff/232
        yV9xOLbfBxe21as9373a+X3ZRzBeAkVtBSBSnSSnODDWJ6TlGSKVThzpD60VWpyCYKlZWZBGtLt
        lziYf2IwnWhixiHr/vZE8FA==
X-Received: by 2002:a1c:790a:: with SMTP id l10mr144596wme.80.1590615888699;
        Wed, 27 May 2020 14:44:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Af0J2CmuPpUG32rxwXfc1KYndN+k+SQB+Tn++8tDC1cfUbE9HPS7Kypz3xsxeZWawipQoA==
X-Received: by 2002:a1c:790a:: with SMTP id l10mr144569wme.80.1590615888450;
        Wed, 27 May 2020 14:44:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8? ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
        by smtp.gmail.com with ESMTPSA id j135sm4749631wmj.43.2020.05.27.14.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 14:44:47 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        kvm@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Jim Mattson <jmattson@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        David Rientjes <rientjes@google.com>,
        Jonathan Adams <jwadams@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
 <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
 <20200527142741.77e7de37@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <925502d6-875a-4d19-b574-1ffd47a9c2ce@redhat.com>
Date:   Wed, 27 May 2020 23:44:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527142741.77e7de37@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27/05/20 23:27, Jakub Kicinski wrote:
> On Wed, 27 May 2020 23:07:53 +0200 Paolo Bonzini wrote:
>>> Again, I have little KVM knowledge, but BPF also uses a fd-based API,
>>> and carries stats over the same syscall interface.  
>>
>> Can BPF stats (for BPF scripts created by whatever process is running in
>> the system) be collected by an external daemon that does not have access
>> to the file descriptor?  For KVM it's of secondary importance to gather
>> stats in the program; it can be nice to have and we are thinking of a
>> way to export the stats over the fd-based API, but it's less useful than
>> system-wide monitoring.  Perhaps this is a difference between the two.
> 
> Yes, check out bpftool prog list (bpftool code is under tools/bpf/ in
> the kernel tree). BPF statistics are under a static key, so you may not
> see any on your system. My system shows e.g.:
> 
> 81: kprobe  name abc  tag cefaa9376bdaae75  gpl run_time_ns 80941 run_cnt 152
> 	loaded_at 2020-05-26T13:00:24-0700  uid 0
> 	xlated 512B  jited 307B  memlock 4096B  map_ids 66,64
> 	btf_id 16
> 
> In this example run_time_ns and run_cnt are stats.
> 
> The first number on the left is the program ID. BPF has an IDA, and
> each object gets an integer id. So admin (or CAP_BPF, I think) can
> iterate over the ids and open fds to objects of interest.

Got it, thanks.  But then "I'd hope that whatever daemon collects [BPF]
stats doesn't run as root". :)

>> Another case where stats and configuration are separate is CPUs, where
>> CPU enumeration is done in sysfs but statistics are exposed in various
>> procfs files such as /proc/interrupts and /proc/stats.
> 
> True, but I'm guessing everyone is just okay living with the legacy
> procfs format there. Otherwise I'd guess the stats would had been added
> to sysfs. I'd be curious to hear the full story there.

Yeah, it's a chicken-and-egg problem in that there's no good place in
sysfs to put statistics right now, which is part of what this filesystem
is trying to solve (the other part is the API).

You can read more about Google's usecase at
http://lkml.iu.edu/hypermail/linux/kernel/2005.0/08056.html, it does
include both network and interrupt stats and it's something that they've
been using in production for quite some time.  We'd like the statsfs API
to be the basis for including something akin to that in Linux.

To be honest, it's unlikely that Emanuele (who has just finished his
internship at Red Hat) and I will pursue the networking stats further
than the demo patch at the end of this series. However, we're trying to
make sure that the API is at least ready for that, and to probe whether
any developers from other subsystems would be interested in using
statsfs.  So thanks for bringing your point of view!

Thanks,

Paolo

