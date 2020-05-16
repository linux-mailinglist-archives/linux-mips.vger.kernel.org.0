Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C224D1D609C
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 13:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgEPLzb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 07:55:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45902 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726197AbgEPLza (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 May 2020 07:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589630128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=erfjzqOuUiVfB794M6kP1tZ4CPJtvAiKcW2ogPScaak=;
        b=ajTe+J9zTefnFKFz5i53WVv/e96X3yw5Va4OdZ3zCBiynUuxr3DM0c9NB9ZbPyQZDJ8tzi
        hSRaB+BTJMf/nZr5ZKITG4eSTWRKTkk/5fUpdS/f6NGLXF0CXS/mpxz5yce5EgPuT8nlsa
        uz71lgC0XSpqzZozJL8bIU4v07DJR5s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-rWJn1Ep9PfmFDP79rP-RVQ-1; Sat, 16 May 2020 07:55:27 -0400
X-MC-Unique: rWJn1Ep9PfmFDP79rP-RVQ-1
Received: by mail-wr1-f69.google.com with SMTP id p13so1432624wrt.1
        for <linux-mips@vger.kernel.org>; Sat, 16 May 2020 04:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=erfjzqOuUiVfB794M6kP1tZ4CPJtvAiKcW2ogPScaak=;
        b=ZIQgBc032grIQ1Ph9W4D5JFGfopt3bgfrOxfgYuNEPiLv/hBjEkA4INYTBJCMDP2e4
         pvC6HpfT0PIzOQLqLoCBMkwyFraob3sKvclhq2rkrVjx+GAvrZM5NF7BKA+8uPGGynUG
         jO2CJHLCWA1t9za06HY8TFKiUGR79vKsnrYdV9kR8bB9Y0XJgbfrCEuhGr+G3Jemwfub
         WuK/+FwtmBtd+txq/LlWPGRbeFTTd40WnLxJN+luNO30uczQPMJkmBbpZyElkPX1ZzV1
         UAaGAvlvDLguApJlQV99qH2lRoJiM5bTdWYFvHPH83Ej1uRWQyNMn1Oy6hRCxm+UwdBT
         SDeQ==
X-Gm-Message-State: AOAM530ksrIMjXzLVrx4dYJWa+ql/XHky8J08cNCQD6z4Sojk8modpJw
        pd3WtgeKFGHKcTNDhCIJ1TYZdG9k2NupRGEoOrZbvix6OL1x3V9njdB64eKpdZDO41qkK3OICMl
        H7JOc1xIaejlbXms4qziVXQ==
X-Received: by 2002:a7b:c193:: with SMTP id y19mr8936343wmi.158.1589630125826;
        Sat, 16 May 2020 04:55:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx0u3Wf3M+dvD4mI+q/+PzHBMijrTsiO0tpb+a082mvbkOA8Q+PkdCA/N1eOKSzvq67xudIw==
X-Received: by 2002:a7b:c193:: with SMTP id y19mr8936328wmi.158.1589630125560;
        Sat, 16 May 2020 04:55:25 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.132.248])
        by smtp.gmail.com with ESMTPSA id u65sm3097357wmg.8.2020.05.16.04.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2020 04:55:24 -0700 (PDT)
Subject: Re: [PATCH V5 15/15] MAINTAINERS: Update KVM/MIPS maintainers
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        kvm <kvm@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>
References: <1589359366-1669-1-git-send-email-chenhc@lemote.com>
 <1589359366-1669-16-git-send-email-chenhc@lemote.com>
 <AC9338A0-F449-4DCA-A294-248C86D57877@flygoat.com>
 <CAAhV-H7OTeMy2Yp2PunD+2KVzzPDT+-xGGgbpRNzhb8C-p8-7g@mail.gmail.com>
 <20200515211353.GB22922@alpha.franken.de>
 <CAAhV-H58G7+se6VTBMo2R4joDXngF-c_W=fh8=zD8rVnono=gg@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1a22adb0-0b7a-24a3-e762-7b9919a70a8e@redhat.com>
Date:   Sat, 16 May 2020 13:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H58G7+se6VTBMo2R4joDXngF-c_W=fh8=zD8rVnono=gg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/05/20 11:36, Huacai Chen wrote:
>> I'm happy to see you taking care of the KVM part. So how is your plan
>> to handle patches ? Do want to collect them and send pull requests to
>> me ? Or should I just pick them up with your Acked-by ?
> I think we can only use the second method, because both Aleksandar and
> me don't have a kernel tree in kernel.org now.

If you don't mind, I generally prefer to have MIPS changs submitted
through the KVM tree, because KVM patches rarely have intrusive changes
in generic arch files.  It's more common to have generic KVM patches
that require touching all architectures.

For 5.8 I don't have anything planned that could cause conflicts, so
this time it doesn't matter; but I can pick these up too if Thomas acks
patches 6, 12 and 14.

Thanks,

Paolo

