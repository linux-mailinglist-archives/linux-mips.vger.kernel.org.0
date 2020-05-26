Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 465571E25DD
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728492AbgEZPpZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:45:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23636 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728201AbgEZPpY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 11:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590507922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Dt6LQHnd8XQKjoczzuKu5+J73yx/PTFTJmXrE029Qj0=;
        b=MuDE1EeNGCQ7ZtyasjHIeRquVoyGlw4ms/cF48n+wazvpvZJXtfMaHWohfbEpb6eu/b5pd
        cagcXwYz82p5Nr22SwvYHKapCY9bDujsdyxeL5jbNE0kD6wB2awofKGhTvYwW4Qc8IF3qm
        sR+IEuKfj/j1E+CuQh5LmGbRLqBM3+E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-sPA2QOaTPLOkRSk93i4cvw-1; Tue, 26 May 2020 11:45:20 -0400
X-MC-Unique: sPA2QOaTPLOkRSk93i4cvw-1
Received: by mail-wr1-f70.google.com with SMTP id j8so3203243wrb.9
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2020 08:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dt6LQHnd8XQKjoczzuKu5+J73yx/PTFTJmXrE029Qj0=;
        b=BtNgBSVVQ57W2+T9pfQDI2HDIuMdWMOVPGHbYxMRjMOM3bP2OmpugxfkUc9HEDojg8
         Eb4kEKntypRbM+3duQ5I5KApRhivhTuEHUdwfY9Knjtn/oVWOsqtl9w7BX3z9ZNeysir
         qXE9WVOVtr7bH7TFi5QwttaJ7ol9m+ODrB/mQV+olB6CIids9x0mE5LhPI9tAG0xSrNI
         ITcmEiVc6TMbZigHtl0DohPhX7b751YNpDN3sdehOWY6OCiQYosysjAJ/E4Mnd1jm/R2
         g4OeGl3rY0qK1akHuxvFLmfwlHPqXBbVYv/5Bx5TqJ7Im38gbrvYSss9v9iIyR73Kdmu
         0Fpg==
X-Gm-Message-State: AOAM531YnwlAxfzWodWrw+BqZRFsVg4AHCrLgyPAD7mfoeeNCbV2tloY
        HieqNbBlDY2PYNTvQ7me2VqCyd0HpY/aZNVFY82/sKzBWOKNa/qfsBf6Zhl+tC0dLU+9895qDCk
        e+L3yA2du24ulZoRCd8SnBA==
X-Received: by 2002:a05:6000:1202:: with SMTP id e2mr2590856wrx.231.1590507919724;
        Tue, 26 May 2020 08:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5If1uNgTKWEisUAJowYTPwcuzMOOow4nahat1ESbDjPkHGjhZwTTbQrIPi02UQ5LtAAq4hw==
X-Received: by 2002:a05:6000:1202:: with SMTP id e2mr2590848wrx.231.1590507919516;
        Tue, 26 May 2020 08:45:19 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.118])
        by smtp.gmail.com with ESMTPSA id u10sm32544wmc.31.2020.05.26.08.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 08:45:18 -0700 (PDT)
Subject: Re: [PATCH v3 7/7] [not for merge] netstats: example use of stats_fs
 API
To:     Andrew Lunn <andrew@lunn.ch>
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
        linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org
References: <20200526110318.69006-1-eesposit@redhat.com>
 <20200526110318.69006-8-eesposit@redhat.com>
 <20200526141605.GJ768009@lunn.ch>
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <99217496-929f-ed3b-8e9e-bbd26d06e234@redhat.com>
Date:   Tue, 26 May 2020 17:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526141605.GJ768009@lunn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Hi Andrew

> How do you atomically get and display a group of statistics?
> 
> If you look at how the netlink socket works, you will see code like:
> 
>                  do {
>                          start = u64_stats_fetch_begin_irq(&cpu_stats->syncp);
>                          rx_packets = cpu_stats->rx_packets;
>                          rx_bytes = cpu_stats->rx_bytes;
> 			....
>                  } while (u64_stats_fetch_retry_irq(&cpu_stats->syncp, start));
> 
> It will ensure that rx_packets and rx_bytes are consistent with each
> other. If the value of the sequence counter changes while inside the
> loop, the loop so repeated until it does not change.
> 
> In general, hardware counters in NICs are the same.  You tell it to
> take a snapshot of the statistics counters, and then read them all
> back, to give a consistent view across all the statistics.
> 
> I've not looked at this new code in detail, but it looks like you have
> one file per statistic, and assume each statistic is independent of
> every other statistic. This independence can limit how you use the
> values, particularly when debugging. The netlink interface we use does
> not have this limitation.

You're right, statistics are treated independently so what you describe 
is currently not supported.

In KVM the utilization is more qualitative, so there isn't such problem.
But as long as the interface is based on file access, the possibility of 
snapshotting might not be useful; however, it could still be considered 
to be added later together with the binary access.

Jonathan, how is your metricfs handling this case?

Thank you,
Emanuele

