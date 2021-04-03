Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC6B353374
	for <lists+linux-mips@lfdr.de>; Sat,  3 Apr 2021 12:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236572AbhDCKnm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Apr 2021 06:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54986 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236561AbhDCKnl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Apr 2021 06:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617446618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=61f7oFHi8TAP6R3U20yKNfdx/rbT6AGQPs/+ynBgVBY=;
        b=WGWrotXFW7cZY0XTMnVwSzui8WBSfACQmWaM7IxEqDrzJb1cFjh2uBo3gBLWQ13d2fsNNu
        9rkCOpjJ1vYewsz8BQXcWoN0yvWMdQLh6F3F7wVxGqONIgTxMI+6LQh7Q0wIt7b8dQeEoW
        2pys93PMT2lTmeUUM0quROe1AKQsW30=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-EDMQEAUqNUGBnm_cGN3FQA-1; Sat, 03 Apr 2021 06:43:37 -0400
X-MC-Unique: EDMQEAUqNUGBnm_cGN3FQA-1
Received: by mail-wr1-f71.google.com with SMTP id z6so5460087wrh.11
        for <linux-mips@vger.kernel.org>; Sat, 03 Apr 2021 03:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=61f7oFHi8TAP6R3U20yKNfdx/rbT6AGQPs/+ynBgVBY=;
        b=bIP+RRd1XhVUbERwTR7AvkG1kr64MJ34myJAvXWjr0ifhFXHM5u+06GYlrSQgqvr9I
         vyNmRZupOo+oVe7CRRtDFl7lKgqW8Fw+W9ZVCSpM+dvssB1EMFpdLvEe92FWzgIkjWWi
         RMvF5elG1Ztqii0Mp8H5fbl5m3csNZOve5V8rq1q4QPb3sVU741KqdoU4PfqBhgmGeKz
         gyXKrSQVMqUZDPsqS0qE8y+33HlSBOy7Cr4u97ElBOuHsS/ZkOKKXXYjLU+gRRokZ3YL
         Lk1OaV+DZhOAe+Y/5Muias8b4Q2AI9BPMYOl+LplXmJabLVovEI9wzv6HVnqJYZycZHN
         oA2w==
X-Gm-Message-State: AOAM530VbuDwoomEO06Bzgmh0dyk1mGOoXE6eOpL/eJ6B9swwY+VtzyF
        RqR/OuuqohDQSHuHjLxMR/05dvKV7k6GKjfP7DJheI0E//3iApTQq8iVYerRrjrAwC2ZMr6ZLHy
        ydhulv/zWzYDOa+WFIbaMsw==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr19420846wrx.52.1617446616085;
        Sat, 03 Apr 2021 03:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6ZVY9JvAkugXwQNIfRTY/EM8knw5XoWwMss5fVKS+esOCD+LL95JYT9Dol9NEqaEHEp3NDQ==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr19420831wrx.52.1617446615873;
        Sat, 03 Apr 2021 03:43:35 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m5sm18762558wrq.15.2021.04.03.03.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Apr 2021 03:43:35 -0700 (PDT)
Subject: Re: [PATCH 2/4] KVM: MIPS: rework flush_shadow_* callbacks into one
 that prepares the flush
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        seanjc@google.com, "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20210402155807.49976-1-pbonzini@redhat.com>
 <20210402155807.49976-3-pbonzini@redhat.com>
 <CAAhV-H4wskLvGD1hhuS2ZDOBNenCcTd_K8GkYn1GOzwnEvTDXQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aab8a915-6e73-3cba-5392-8f940479a011@redhat.com>
Date:   Sat, 3 Apr 2021 12:43:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4wskLvGD1hhuS2ZDOBNenCcTd_K8GkYn1GOzwnEvTDXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/04/21 04:31, Huacai Chen wrote:
> Hi, Paolo,
> 
> TE mode has been removed in the MIPS tree, can we also remove it in
> KVM tree before this rework?

I tried the merge and it will be enough for Linus to remove 
arch/mips/kvm/trap_emul.c.  So I will leave it as is, but next time I'd 
prefer KVM MIPS changes to go through either my tree or a common topic 
branch.

Paolo

