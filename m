Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D09BFCCEE9
	for <lists+linux-mips@lfdr.de>; Sun,  6 Oct 2019 07:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfJFF7B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Oct 2019 01:59:01 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25526 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfJFF7B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Oct 2019 01:59:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570341511; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=QruYSnbHA0yyNDY/sgQYXicI+jC/qwjzuFoMQZmVs3usxOg5E0lE34ZdydyhHFQxpn5PK/9ezuZTqcghGsQprHTmFcSwPMW/0t16ziNS7PE5UqiyawJyUg5NTkvyoNlBbz6Waavgb/ktngkWZbCTowIW/jTl7HTGG/awOf9xkdw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570341511; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=FIVmd6RsuPA3669yj2KqpaCMQ3WoQUu2gHxtBlIpTTU=; 
        b=N6xELN1wDY83oG4cUNWMwaGGJu+btURHCd7oQ99dulTcestCPPzjeZ2+NGcdSvWJEq86hiO6ZyFnMWcOiug9SvEK1LZXhbSq65gQbbaylAyFgU6E9u31z93e12TAU5CBWJeKRT54/Bwe0jNchGbmcey4zXu3A433xX3q6tVm1oM=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=tge/DNPCR423FXM+9+fHt2KFD7ONafxrNKUeOCHFbuXuXI76etVqhZ3+brx9obILTPiKVJTOwD44
    5WUB37H3f/dLuSM5LxorQxwPEpBXvj47T8sPFuyeuszc+7aKPttq  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570341511;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        l=747; bh=FIVmd6RsuPA3669yj2KqpaCMQ3WoQUu2gHxtBlIpTTU=;
        b=fopFJTxW+5Sq2WarzwK+qaEywXDKt1iyvpK360sR8zEDpLzrp6NPRYJwhR9rzOoU
        uZG1bLt/SJVMLuUVBsR7OyBQLGxckhu+xf8ToBT3Uie7HVOQ6KBN6p77mERJyrixO1A
        RsybX5KbZ7L1+e+jWNrgYXfQiHDyP/F/oTDiMEag=
Received: from [192.168.88.140] (171.221.113.164 [171.221.113.164]) by mx.zohomail.com
        with SMTPS id 1570341509230422.7816399434387; Sat, 5 Oct 2019 22:58:29 -0700 (PDT)
Subject: Re: [PATCH 4/4] MMC: Ingenic: Add support for JZ4760 and support for
 LPM.
To:     Ulf Hansson <ulf.hansson@linaro.org>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1567669089-88693-5-git-send-email-zhouyanjie@zoho.com>
 <CAPDyKFo0aR2fhCd8qCNAf7hoXSjV+9vG1BqB6vEM=B9Vpmpovg@mail.gmail.com>
Cc:     linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, syq@debian.org,
        jiaxun.yang@flygoat.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5D99827E.9070505@zoho.com>
Date:   Sun, 6 Oct 2019 13:58:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo0aR2fhCd8qCNAf7hoXSjV+9vG1BqB6vEM=B9Vpmpovg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Uffe,
On 2019=E5=B9=B410=E6=9C=8803=E6=97=A5 18:00, Ulf Hansson wrote:
> On Thu, 5 Sep 2019 at 09:40, Zhou Yanjie <zhouyanjie@zoho.com> wrote:
>> 1.add support for probing mmc driver on the JZ4760 Soc from Ingenic.
>> 2.add support for Low Power Mode of Ingenic's MMC/SD Controller.
> Normally we try to make "one" change per patch, unless there are some
> good reasons not to.
>
> In this case, it seems like you should rather split this patch into
> two separate pieces. Can you please do that?

OK,I'll split it in v2.

>
> Additionally, please change the prefix for the commit message header
> to start with "mmc: jz4740:"

sure, it will be change in v2.

>
> [...]
>
> Kind regards
> Uffe
Thanks  and best regards!


