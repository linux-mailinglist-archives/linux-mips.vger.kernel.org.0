Return-Path: <linux-mips+bounces-639-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE5A80B967
	for <lists+linux-mips@lfdr.de>; Sun, 10 Dec 2023 07:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26E5DB20A04
	for <lists+linux-mips@lfdr.de>; Sun, 10 Dec 2023 06:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE7C23DD;
	Sun, 10 Dec 2023 06:48:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 66D8AB8;
	Sat,  9 Dec 2023 22:48:54 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.254])
	by gateway (Coremail) with SMTP id _____8DxVuhUX3VlmkxAAA--.28032S3;
	Sun, 10 Dec 2023 14:48:52 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.109.254])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxkN1NX3VldDNaAA--.5375S3;
	Sun, 10 Dec 2023 14:48:47 +0800 (CST)
Message-ID: <93b41b72-a6ac-4d7f-95f0-ba42399729fc@loongson.cn>
Date: Sun, 10 Dec 2023 14:48:45 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 1/2] stmmac: dwmac-loongson: drop useless check for
 compatible fallback
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, jiaxun.yang@flygoat.com,
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
 <20230616-activity-shed-be3c13e5ac71@spud>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <20230616-activity-shed-be3c13e5ac71@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxkN1NX3VldDNaAA--.5375S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZw1DGF4fJr1fAry5Aw15KFX_yoWDtwcEkF
	WfW3s7KrWIqFWDXwsYkFZ3tr90gF1qyF15Ary8Xwn2gwn5AFWkA3ykCryIq343XFWrCFsx
	uF1xAwnrCr12kosvyTuYvTs0mTUanT9S1TB71UUUU17qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbTAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUShiSDUUUU


在 2023/6/17 02:52, Conor Dooley 写道:
> On Fri, Jun 16, 2023 at 12:31:26PM +0200, Krzysztof Kozlowski wrote:
>> Device binds to proper PCI ID (LOONGSON, 0x7a03), already listed in DTS,
>> so checking for some other compatible does not make sense.  It cannot be
>> bound to unsupported platform.
>>
>> Drop useless, incorrect (space in between) and undocumented compatible.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Might be worth noting that dropping it is required to allow the
> new loongarch dts stuff to be functional with a sane set of compatibles.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Thank you Krzysztof for your work. when I am
adding more devices support to stmmac, I found that your
two patches seemed to be forgotten.
Thomas, Jiaxun. Can the two patches get an Acked-by?
My stmmac patch thread:
<https://lore.kernel.org/loongarch/cover.1699533745.git 
.siyanteng@loongson.cn/T/#md3108d29a5efe71b27f4c5ccf5d0217571bf6586>
Thanks,
Yanteng

>
> Cheers,
> Conor.


