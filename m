Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABEF1E4FD2
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 23:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387410AbgE0VID (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 17:08:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57429 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728475AbgE0VIB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 17:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590613679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3sSNRFYrb0CdmbwXzPVaN6Wl+qrkOkjvYM/9vtvRcHo=;
        b=Eu4IoVjsrhT3li/XvMZj7RRjOdwTvNumFAFfw+ppIjxEZIqdDG7vqhTTN1M/yJOf2Lh+8p
        nOQqFyiu5wz5kIclZaQn6+gWqr/WJPZ+yIeY8fUN3f7BCJhd2AxPfV8pQOBl7q1sUDViHM
        FtcA7G05xHY0kLkbKUzqYmjD3WYvHjY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-rw8NBqAZMsKR8cC-AhNNpQ-1; Wed, 27 May 2020 17:07:57 -0400
X-MC-Unique: rw8NBqAZMsKR8cC-AhNNpQ-1
Received: by mail-wm1-f69.google.com with SMTP id t9so244777wml.4
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 14:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3sSNRFYrb0CdmbwXzPVaN6Wl+qrkOkjvYM/9vtvRcHo=;
        b=l8fHq5RAapQkJHdtX6/yZM9GjEJrjmMs3yWHqfBdt1RLjGFQ6DRJN2a1NCPd1XiGd6
         zVNsLT5nYsSc6Dy5FXEKNjw3XtcQuxUzJEZFQUSuG+f88PLjozGXq0JTitYUrZXyMwk9
         DB7TgqvlqvBZf6PpwO/y5PAsk3CpXs+xZO608EFfAHJCZ2c00i8JHo/DxOzH/6Es0Z92
         PR3t2iRsHvMOwJ0FU6Nwvv1z/SGwrIQedsJBxa3wZzGe3TOvFRQjO5WBVVVwG3Kn1Tdg
         AJyNeOs16wLZzrBo1efRtN+XTbdDDcci07zLfCb89ZGrU/znUSEIpv3KXJd38N+P02qq
         Q/cw==
X-Gm-Message-State: AOAM531y/rIt0ZllsWE3s1Ot73fHNwpdzyB/TJXZVDRNqQKKsonJ5xr4
        gYSA+zg0f7Yr2DGTb7XeVkkFFyEB99HKwTKMd6e7sOLA21+Mihx20kbz1ncW3bWjXeX9gYlyruw
        YlPBz9E8ZNj5DPg77ifcTVg==
X-Received: by 2002:adf:e908:: with SMTP id f8mr195576wrm.184.1590613676653;
        Wed, 27 May 2020 14:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/MqK9aixnJqSNydmC9tSwCyqyq7nI9EAoQtkXsEPNQuE8I0JoA6xnM6f4HETfKsks8bq+5g==
X-Received: by 2002:adf:e908:: with SMTP id f8mr195551wrm.184.1590613676318;
        Wed, 27 May 2020 14:07:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8? ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
        by smtp.gmail.com with ESMTPSA id v27sm4074887wrv.81.2020.05.27.14.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 14:07:55 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To:     Jakub Kicinski <kuba@kernel.org>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc:     kvm@vger.kernel.org,
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <af2ba926-73bc-26c3-7ce7-bd45f657fd85@redhat.com>
Date:   Wed, 27 May 2020 23:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527132321.54bcdf04@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 27/05/20 22:23, Jakub Kicinski wrote:
> On Wed, 27 May 2020 15:14:41 +0200 Emanuele Giuseppe Esposito wrote:
>> Regarding the config, as I said the idea is to gather multiple 
>> subsystems' statistics, therefore there wouldn't be a single 
>> configuration method like in netlink.
>> For example in kvm there are file descriptors for configuration, and 
>> creating them requires no privilege, contrary to the network interfaces.
>
> Enumerating networking interfaces, addresses, and almost all of the
> configuration requires no extra privilege. In fact I'd hope that
> whatever daemon collects network stats doesn't run as root :)
> 
> I think enumerating objects is of primary importance, and statistics 
> of those objects are subordinate.

I see what you meant now.  statsfs can also be used to enumerate objects
if one is so inclined (with the prototype in patch 7, for example, each
network interface becomes a directory).

> Again, I have little KVM knowledge, but BPF also uses a fd-based API,
> and carries stats over the same syscall interface.

Can BPF stats (for BPF scripts created by whatever process is running in
the system) be collected by an external daemon that does not have access
to the file descriptor?  For KVM it's of secondary importance to gather
stats in the program; it can be nice to have and we are thinking of a
way to export the stats over the fd-based API, but it's less useful than
system-wide monitoring.  Perhaps this is a difference between the two.

Another case where stats and configuration are separate is CPUs, where
CPU enumeration is done in sysfs but statistics are exposed in various
procfs files such as /proc/interrupts and /proc/stats.

Thanks,

Paolo

