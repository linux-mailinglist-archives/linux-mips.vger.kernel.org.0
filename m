Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB221E4320
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 15:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387766AbgE0NOt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 09:14:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44584 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387518AbgE0NOs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 09:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590585286;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xp4IU27b7aXZqohMpJFZPawUcolyfH/CQm0FvETLmFY=;
        b=Kj5s48U58f+E+NHD5689YISH21EuY37XReHamg+khwWV6BO6nNQlH72QUzJ8PHnZyHjb9b
        v9X17Ytj54KLC0kyp+nzrTXIfqYioHB2iEHHr9oiEPyFL3vT0AV2pIMcNGs3NHeoNStK7C
        IcSyIvEszvL5hPrYe/G5PhRixxF8z0g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-qp-fUFYjPtKHtF4EtjXnRA-1; Wed, 27 May 2020 09:14:45 -0400
X-MC-Unique: qp-fUFYjPtKHtF4EtjXnRA-1
Received: by mail-wr1-f71.google.com with SMTP id p10so755230wrn.19
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 06:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xp4IU27b7aXZqohMpJFZPawUcolyfH/CQm0FvETLmFY=;
        b=pa0jXIeXp/8MpX699LI4vRvNX/+HQYDEodMNpN0OwaYRhGEmGX/+4SXsYNzxhB2SZF
         MHm1rnq51d96tCsVDNehR+gSWgVI03ju6MnrEV8/cvIdqoClXmS5Tj4M3Yxa8Blep18M
         CxcdSqq9JYnUugb6way5R39lojast4sLDfPis6+zEmgK4MV+34UmMXqLJL6SNmfIKGQ2
         isfe9IxDHFdIvCfntlJDLCOkmqqkBjp1/C2o2hCkSE1w6WGLFFfFgoHdC8a7hq7paXdI
         N9yISIo2+uKUp6aWSJ5eieeW66RPBxKXRQI1Yxn0RYQ5cQP4tqJCy2B4/4NyTMoSZIsE
         IwNQ==
X-Gm-Message-State: AOAM533S127zePSD/QC5nELZ7U1ooYlh3ZYGGV5LizVPvLAquermWhNH
        SShEehO54NdN2FAE8bdpWVr17EJP0rpODY31nJzL9G3ZtKr1h73c4iXCYvdBKkw1e9EOilAhZqu
        DmoCHA/TWCb89mMf/NrYG1g==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr4189538wmb.3.1590585284254;
        Wed, 27 May 2020 06:14:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXDD9pd6xDx85wKJ6DSUd0+jHdsTLXsbOgS1BfL3siVJ+UTokB2SEyRQkeYWpyFjB2Klsulg==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr4189496wmb.3.1590585283890;
        Wed, 27 May 2020 06:14:43 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.225])
        by smtp.gmail.com with ESMTPSA id r4sm2825862wro.32.2020.05.27.06.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 06:14:43 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] Statsfs: a new ram-based file system for Linux
 kernel statistics
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     kvm@vger.kernel.org,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
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
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <6a754b40-b148-867d-071d-8f31c5c0d172@redhat.com>
Date:   Wed, 27 May 2020 15:14:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526153128.448bfb43@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


>>
>> The file system is mounted on /sys/kernel/stats and would be already used
>> by kvm. Statsfs was initially introduced by Paolo Bonzini [1].
> 
> What's the direct motivation for this work? Moving KVM stats out of
> debugfs?

There's many reasons: one of these is not using debugfs for statistics, 
but also (and mainly) to try and have a single tool that automatically 
takes care and displays them, instead of leaving each subsystem "on its 
own".

Sure, everyone gathers and processes stats in different ways, and the 
aim of this tool is to hopefully be extensible enough to cover all needs.
> In my experience stats belong in the API used for creating/enumerating
> objects, statsfs sounds like going in the exact opposite direction -
> creating a parallel structure / hierarchy for exposing stats.

  I know
> nothing about KVM but are you sure all the info that has to be exposed
> will be stats?I don't understand, what do you mean here?

> 
> In case of networking we have the basic stats in sysfs, under the
> netdevice's kobject. But since we're not using sysfs much any more
> for config, new stats are added in netlink APIs. Again - same APIs
> used for enumeration and config.

I don't really know a lot about the networking subsystem, and as it was 
pointed out in another email on patch 7 by Andrew, networking needs to 
atomically gather and display statistics in order to make them 
consistent, and currently this is not supported by stats_fs but could be 
added in future.

In addition, right now it won't work properly if the networking 
namespaces are enabled. That is another issue to take into 
consideration. That's also why I marked patch 7 as "not for merge"

Regarding the config, as I said the idea is to gather multiple 
subsystems' statistics, therefore there wouldn't be a single 
configuration method like in netlink.
For example in kvm there are file descriptors for configuration, and 
creating them requires no privilege, contrary to the network interfaces.

Thank you,
Emanuele

