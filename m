Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5462FC776
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2019 14:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKNNaC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Nov 2019 08:30:02 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25862 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfKNNaC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Nov 2019 08:30:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573738192; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=KCydP6eIxUn2igeczZ3T8/M2Hhl/f27NTAnqr3kM9fY1+GNJow5oBqwRScCmLYSFGIuQz7lYXsWjqfZHsQpDuWqDVsvyVwi07UOM2BKBG030mR5rGAISQnAmVcaVkyhqNr18eeZZCf9dpM/TSbHnYmAvVqxRX7Yq9ssTaEam+wU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573738192; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=tuWnqfKvsZkLU+jDJagYgAusq7Vm0YZq0abqBev2SfQ=; 
        b=A8B5CZwkVoT4ESeUjditFj8/GlTCOWuJatnWq9a9dZqJIgqIrjKDOx0Ahmsi59tx3WBHOLK1JKmVuDpf6+tnEpUuedkKmdg/KWZR8KKkLlR8Xm/elhVXkIL2ipUtS9lXV1Ll7hIGmiQnfwEBXtZwS7XuaKD9OR+v9PiRURF7rJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=rS/Sv/W/XTTB732XTmLvO2SKxpu527ONZfwoMWJfPePzPb4OGQ/RXZtUZVl3dCa7qzq7+ARHheEy
    ogEj26PAf93WhSmeZZvuw25ndr75SSEjVCuab1Wb/o68YoQB2UO3  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573738192;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=917; bh=tuWnqfKvsZkLU+jDJagYgAusq7Vm0YZq0abqBev2SfQ=;
        b=DH/8dDhhF0N3QpP9WB0Q/2xFYY4r2ItP6b0ZgOcGLZN+Qm2ty/BOQvhv+2p+est7
        KFJpu74qB7R7Lu4Z9sQYqv1TKh47BJyk6Lx1tQRQQvWFPOsp3PEyYHTuYv3jzMxsq+q
        1XvTkTAPKTfiu9IYvbd3dMhPWJWGqoiaORqwhQrk=
Received: from [192.168.10.218] (171.221.112.167 [171.221.112.167]) by mx.zohomail.com
        with SMTPS id 1573738191942108.24330874646944; Thu, 14 Nov 2019 05:29:51 -0800 (PST)
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: Add X1000 bindings.
To:     Rob Herring <robh@kernel.org>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
 <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com>
 <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
 <20191112005544.GB7038@bogus>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, paul.burton@mips.com, sboyd@kernel.org,
        robh+dt@kernel.org, syq@debian.org, mark.rutland@arm.com,
        paul@crapouillou.net
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DCD56C5.1050106@zoho.com>
Date:   Thu, 14 Nov 2019 21:29:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20191112005544.GB7038@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 2019=E5=B9=B411=E6=9C=8812=E6=97=A5 08:55, Rob Herring wrote:
> On Sun, 10 Nov 2019 17:28:21 +0800, Zhou Yanjie wrote:
>> Add the clock bindings for the X1000 Soc from Ingenic.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>   .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
>>   include/dt-bindings/clock/x1000-cgu.h              | 44 ++++++++++++++=
++++++++
>>   2 files changed, 45 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/x1000-cgu.h
>>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

I'm sorry, it's my mistake, I forgot to add these tags.
I'll pay more attention on this next time.

Best regards=EF=BC=81


