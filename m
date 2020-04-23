Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C566F1B5BA5
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 14:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgDWMnS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 08:43:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:35362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgDWMnR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 08:43:17 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CF652074F;
        Thu, 23 Apr 2020 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587645797;
        bh=Jf4U83nslK4pLE/BKjzX7LhcMz5BzxX0wK8k8b1LmEQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=x8suleylMoRjsePqe89CrWPBmZhjfz1Lm3yD8IEyVyMofPYEVyOy3Ljc3xgzOLje4
         +Dgz55oeV9szl7pUhrwRT6HBD9UoCwHf4Z9J6rUyWJynYmOufitJs2HXkZzBP5U1NI
         YLwoRTIJSnRJdid5hhJN64cNoMAT/k9ZyMSEBri0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jRbCF-005lvs-Kh; Thu, 23 Apr 2020 13:43:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 23 Apr 2020 13:43:15 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: interrupt-controller: Add Loongson PCH
 MSI
In-Reply-To: <CAAhV-H43ds5YnW+h3zpbwedT0Lksz_o5d=Sz0Uqn+--uuDHN1A@mail.gmail.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200422142428.1249684-7-jiaxun.yang@flygoat.com>
 <CAAhV-H43ds5YnW+h3zpbwedT0Lksz_o5d=Sz0Uqn+--uuDHN1A@mail.gmail.com>
Message-ID: <b645bfeba3c1c9d3167aef68868ef09f@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: chenhc@lemote.com, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Huacai,

On 2020-04-23 06:55, Huacai Chen wrote:
> Hi, Jiaxun,
> 
> On Wed, Apr 22, 2020 at 10:28 PM Jiaxun Yang <jiaxun.yang@flygoat.com> 
> wrote:
>> 
>> Add binding for Loongson PCH MSI controller.
>> 
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  .../loongson,pch-msi.yaml                     | 56 
>> +++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml 
>> b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
>> new file mode 100644
>> index 000000000000..dfb9cecacba0
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: 
>> "http://devicetree.org/schemas/interrupt-controller/loongson,pch-msi.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Loongson PCH MSI Controller
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +description: |
>> +  This interrupt controller is found in the Loongson-7A family of PCH 
>> for
> Please use "Loongson's LS7A family" here.

It's the fourth email you send on the same subject. I think the author
has got the message already. Frankly, it is only a name, and if they
want to call it Bob, so be it.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
