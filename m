Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7128B1CD56C
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2020 11:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbgEKJhP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 May 2020 05:37:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53538 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729322AbgEKJhO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 May 2020 05:37:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589189832;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9/z8oJy0DrW82NKQzFo0pYOXFvWx+Vn3ieQ420AJ3lc=;
        b=KCnegZSi+ZsE0h4FY0B5lpSrUpT08+5ftKvg+49SNpO72ejTT9cOvT+1b6qMLJLr18LIx1
        s2vPQxQs4fT6ZmHftwXRsOYYiy/VFv98g74ndvCZZhIam+3vZy9ToBbdIqaSxEnhIwPrpG
        FlUoN1+tO4q7qEV5TQ4aJBQQKqugTWM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-ceZSNmNsORiqoynWIfPgNw-1; Mon, 11 May 2020 05:37:05 -0400
X-MC-Unique: ceZSNmNsORiqoynWIfPgNw-1
Received: by mail-wm1-f72.google.com with SMTP id a67so1903865wme.6
        for <linux-mips@vger.kernel.org>; Mon, 11 May 2020 02:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9/z8oJy0DrW82NKQzFo0pYOXFvWx+Vn3ieQ420AJ3lc=;
        b=k92iKkvzgPNCFgdBxe4hENNMHIfYuroyHWfi5DfK8BQg55hetBUky2akcSznYIZoY2
         6/zcR3Hfe1soWDsFStTrytXs3lnBVQyMxre06XFKUVHafz+uAKAnlLCNXUu4j5aSLqc5
         zgeJrkvdz8eyQs3MTlpJPm4+zkTNa/g6FOuo64Y6QM+fm/lEUNMqXgCUXppJUGmHPO5l
         MmHhIydWIZFU71e38N9Y1TkolfL6/wwuJn1dPf2WumJRUMS33Trolin4vcjUt+a1kAe6
         FedqSpjAVWvSthJK/CONKW7L3gEQbg0VbLjh+e6EmMc+C9zBn23iJ94MQbyZY1Lamyj7
         FgPg==
X-Gm-Message-State: AGi0PuYHJHsOSavbuwlQs06itIo3Qn1YagKP/8UY0eCUdgvlPCPQ0o3Y
        boh8u4e6SnrAOiwUqIbZodc6vYBcJe1ZcmHxll5q2RY9hUwvtS4tcljzCPtI/vWq8VAbxOEINBk
        iEoa34T2zOoPb8dv64rL9ag==
X-Received: by 2002:adf:9447:: with SMTP id 65mr18006256wrq.331.1589189824501;
        Mon, 11 May 2020 02:37:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypLgXJL2J4QG833y891iupVzJ12ZpeHXWlbbAPxxD6jgWVlOjQHWoAXK6Z1hUwl6JqLwXHJL/w==
X-Received: by 2002:adf:9447:: with SMTP id 65mr18006221wrq.331.1589189824311;
        Mon, 11 May 2020 02:37:04 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.159])
        by smtp.gmail.com with ESMTPSA id r14sm1636537wmb.2.2020.05.11.02.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 02:37:03 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Statsfs: a new ram-based file sytem for Linux
 kernel statistics
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Adams <jwadams@google.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        David Rientjes <rientjes@google.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
 <CA+VK+GN=iDhDV2ZDJbBsxrjZ3Qoyotk_L0DvsbwDVvqrpFZ8fQ@mail.gmail.com>
 <29982969-92f6-b6d0-aeae-22edb401e3ac@redhat.com>
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <20c45f7b-3daa-c300-a8e7-0fd26664080b@redhat.com>
Date:   Mon, 11 May 2020 11:37:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <29982969-92f6-b6d0-aeae-22edb401e3ac@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 5/8/20 11:44 AM, Paolo Bonzini wrote:
> So in general I'd say the sources/values model holds up.  We certainly
> want to:
> 
> - switch immediately to callbacks instead of the type constants (so that
> core statsfs code only does signed/unsigned)
> 
> - add a field to distinguish cumulative and floating properties (and use
> it to determine the default file mode)
> 
> - add a new argument to statsfs_create_source and statsfs_create_values
> that makes it not create directories and files respectively
> 
> - add a new API to look for a statsfs_value recursively in all the
> subordinate sources, and pass the source/value pair to a callback
> function; and reimplement recursive aggregation and clear in terms of
> this function.

Ok I will apply this, thank you for all the suggestions. 
I will post the v3 patchset in the next few weeks. 

In the meanwhile, I wrote the documentation you asked (even though it's 
going to change in v3), you can find it here:

https://github.com/esposem/linux/commit/dfa92f270f1aed73d5f3b7f12640b2a1635c711f

Thank you,
Emanuele

