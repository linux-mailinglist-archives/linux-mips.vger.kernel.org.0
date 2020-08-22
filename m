Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5967824E558
	for <lists+linux-mips@lfdr.de>; Sat, 22 Aug 2020 06:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgHVE1M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Aug 2020 00:27:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57886 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725807AbgHVE1M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Aug 2020 00:27:12 -0400
Received: from [127.0.0.1] (unknown [119.4.253.158])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWuSZnkBfDXQMAA--.15290S2;
        Sat, 22 Aug 2020 12:27:08 +0800 (CST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Mailer: BlackBerry Email (10.3.3.3216)
Message-ID: <20200822042707.5754967.41900.8563@loongson.cn>
Date:   Sat, 22 Aug 2020 12:27:07 +0800
Subject: =?utf-8?b?562U5aSN77yaIFtQQVRDSCAzLzNdIFJldmVydCAiTUlQUzogRmx1c2ggd3Jvbmcg?=
 =?utf-8?b?aW52YWxpZCBGVExCIGVudHJ5IGZvciBodWdlIHBhZ2Ui?=
From:   =?utf-8?b?6buE5rKb?= <huangpei@loongson.cn>
In-Reply-To: <CAAhV-H4pg0pL_Sh+ibYcPs2QjzMJxDOhNwBi3AT=481NOB-5zA@mail.gmail.com>
References: <20200821072329.18006-1-huangpei@loongson.cn>
 <20200821072329.18006-3-huangpei@loongson.cn>
 <CAAhV-H4pg0pL_Sh+ibYcPs2QjzMJxDOhNwBi3AT=481NOB-5zA@mail.gmail.com>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Ambrose <ambrosehua@gmail.com>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
X-CM-TRANSID: AQAAf9AxWuSZnkBfDXQMAA--.15290S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryDuFWxtry5tFWxZFWDurg_yoWrZr1fpr
        ZYyFn8JFW5trn8WFykAFWDXF43u3ykW392qwsrKry5Jw1qkFn3K3Z5Kw1SyrWkCFZ7Zw4I
        9w1qgr98Gr97Zr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
        W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFcxC0VAYjxAxZF0E
        w4CEw7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JwCE64xvF2IEb7IF0Fy7YxBIdaVFxh
        VjvjDU0xZFpf9x0JUHc_-UUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CuKAjgrCoCDljp/lp4vmtojmga8gwqAK5Y+R5Lu25Lq677yaIEh1YWNhaSBDaGVuCuW3suWPkemA
ge+8miAyMDIw5bm0OOaciDIx5pel5pif5pyf5LqUIDE4OjM3CuaUtuS7tuS6uu+8miBIdWFuZyBQ
ZWkK5oqE6YCB77yaIFRob21hcyBCb2dlbmRvZXJmZXI7IFBhdWwgQW1icm9zZTsgTGkgWHVlZmVu
ZzsgWWFuZyBUaWV6aHU7IEdhbyBKdXhpbjsgRnV4aW4gWmhhbmc7IG9wZW4gbGlzdDpNSVBTCuS4
u+mimO+8miBSZTogW1BBVENIIDMvM10gUmV2ZXJ0ICJNSVBTOiBGbHVzaCB3cm9uZyBpbnZhbGlk
IEZUTEIgZW50cnkgZm9yIGh1Z2UgcGFnZSIKCkdvdCBpdCwgaXQgaXMgInRvbyBsYXRlIiwgYW55
dGhpbmcgZWxzZT8KwqAKSSB3aWxsIHJlLXNlbmQgaXQgbmV4dCB3ZWVrCgoKT24gRnJpLCBBdWcg
MjEsIDIwMjAgYXQgMzoyNCBQTSBIdWFuZyBQZWkgPGh1YW5ncGVpQGxvb25nc29uLmNuPiB3cm90
ZToKPgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMDExNWY2Y2JmMjY2NjNjODY0OTZiYzU2ZWVlYTI5
M2Y4NWI3Nzg5Ny4KPgo+IFRoZSBmaXggaW4gMDExNWY2Y2JmMjY2NjNjODY0OTZiYzU2ZWVlYTI5
M2Y4NWI3Nzg5NyBpcyB0d28gbGF0ZSwgc2luY2UKRG8geW91IG1lYW5zICJ0b28gbGF0ZSI/Cgo+
IF9fdXBkYXRlX3RsYiBoaXQgdGhlIHNhbWUgcHJvYmxlbSBmaXJzdC4gU28gbGV0IF9fdXBkYXRl
X3RsYiBmaXggaXQKPgo+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFBlaSA8aHVhbmdwZWlAbG9vbmdz
b24uY24+Cj4gLS0tCj4gYXJjaC9taXBzL21tL3RsYi1yNGsuYyB8IDE1ICsrKysrKysrKysrKysr
LQo+IGFyY2gvbWlwcy9tbS90bGJleC5jIHwgMjUgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9taXBzL21tL3RsYi1yNGsuYyBiL2FyY2gvbWlwcy9tbS90bGItcjRr
LmMKPiBpbmRleCAzOGUyODk0ZDVmYTMuLmNiOGFmYTMyNmIyYyAxMDA2NDQKPiAtLS0gYS9hcmNo
L21pcHMvbW0vdGxiLXI0ay5jCj4gKysrIGIvYXJjaC9taXBzL21tL3RsYi1yNGsuYwo+IEBAIC0z
MjgsNiArMzI4LDcgQEAgdm9pZCBfX3VwZGF0ZV90bGIoc3RydWN0IHZtX2FyZWFfc3RydWN0ICog
dm1hLCB1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHB0ZV90IHB0ZSkKPiAvKiB0aGlzIGNvdWxkIGJl
IGEgaHVnZSBwYWdlICovCj4gaWYgKHBtZF9odWdlKCpwbWRwKSkgewo+IHVuc2lnbmVkIGxvbmcg
bG87Cj4gKyB1bnNpZ25lZCBsb25nIGVudHJ5aGk7Cj4gd3JpdGVfYzBfcGFnZW1hc2soUE1fSFVH
RV9NQVNLKTsKPiBwdGVwID0gKHB0ZV90ICopcG1kcDsKPiBsbyA9IHB0ZV90b19lbnRyeWxvKHB0
ZV92YWwoKnB0ZXApKTsKPiBAQCAtMzM1LDcgKzMzNiwxOSBAQCB2b2lkIF9fdXBkYXRlX3RsYihz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiB2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3Qg
cHRlKQo+IHdyaXRlX2MwX2VudHJ5bG8xKGxvICsgKEhQQUdFX1NJWkUgPj4gNykpOwo+Cj4gbXRj
MF90bGJ3X2hhemFyZCgpOwo+IC0gaWYgKGlkeCA8IDApCj4gKyBpZiAoaWR4ID49IGN1cnJlbnRf
Y3B1X2RhdGEudGxic2l6ZXZ0bGIpIHsKPiArIC8qIGhpdCBpbiBGVExCLgo+ICsgKiBJbnZhbGlk
IGl0IHRoZW4gdGxid3IsIHNpbmNlIEZUTEIgaG9sZCBvbmx5IGJhc2UgcGFnZSovCj4gKyBlbnRy
eWhpID0gcmVhZF9jMF9lbnRyeWhpKCk7Cj4gKyB3cml0ZV9jMF9lbnRyeWhpKE1JUFNfRU5UUllI
SV9FSElOVik7Cj4gKyB0bGJfd3JpdGVfaW5kZXhlZCgpOwo+ICsgdGxid191c2VfaGF6YXJkKCk7
Cj4gKyB3cml0ZV9jMF9lbnRyeWhpKGVudHJ5aGkpOwo+ICsKPiArIH0KPiArCj4gKwo+ICsgaWYg
KGlkeCA8IDAgfHwgaWR4ID49IGN1cnJlbnRfY3B1X2RhdGEudGxic2l6ZXZ0bGIpCj4gdGxiX3dy
aXRlX3JhbmRvbSgpOwo+IGVsc2UKPiB0bGJfd3JpdGVfaW5kZXhlZCgpOwo+IGRpZmYgLS1naXQg
YS9hcmNoL21pcHMvbW0vdGxiZXguYyBiL2FyY2gvbWlwcy9tbS90bGJleC5jCj4gaW5kZXggMTRm
OGJhOTMzNjdmLi45YzRjZDA4YzAwZDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9taXBzL21tL3RsYmV4
LmMKPiArKysgYi9hcmNoL21pcHMvbW0vdGxiZXguYwo+IEBAIC03NjIsOCArNzYyLDcgQEAgc3Rh
dGljIHZvaWQgYnVpbGRfaHVnZV91cGRhdGVfZW50cmllcyh1MzIgKipwLCB1bnNpZ25lZCBpbnQg
cHRlLAo+IHN0YXRpYyB2b2lkIGJ1aWxkX2h1Z2VfaGFuZGxlcl90YWlsKHUzMiAqKnAsIHN0cnVj
dCB1YXNtX3JlbG9jICoqciwKPiBzdHJ1Y3QgdWFzbV9sYWJlbCAqKmwsCj4gdW5zaWduZWQgaW50
IHB0ZSwKPiAtIHVuc2lnbmVkIGludCBwdHIsCj4gLSB1bnNpZ25lZCBpbnQgZmx1c2gpCj4gKyB1
bnNpZ25lZCBpbnQgcHRyKQo+IHsKPiAjaWZkZWYgQ09ORklHX1NNUAo+IFVBU01faV9TQyhwLCBw
dGUsIDAsIHB0cik7Cj4gQEAgLTc3MiwyMiArNzcxLDYgQEAgc3RhdGljIHZvaWQgYnVpbGRfaHVn
ZV9oYW5kbGVyX3RhaWwodTMyICoqcCwgc3RydWN0IHVhc21fcmVsb2MgKipyLAo+ICNlbHNlCj4g
VUFTTV9pX1NXKHAsIHB0ZSwgMCwgcHRyKTsKPiAjZW5kaWYKPiAtIGlmIChjcHVfaGFzX2Z0bGIg
JiYgZmx1c2gpIHsKPiAtIEJVR19PTighY3B1X2hhc190bGJpbnYpOwo+IC0KPiAtIFVBU01faV9N
RkMwKHAsIHB0ciwgQzBfRU5UUllISSk7Cj4gLSB1YXNtX2lfb3JpKHAsIHB0ciwgcHRyLCBNSVBT
X0VOVFJZSElfRUhJTlYpOwo+IC0gVUFTTV9pX01UQzAocCwgcHRyLCBDMF9FTlRSWUhJKTsKPiAt
IGJ1aWxkX3RsYl93cml0ZV9lbnRyeShwLCBsLCByLCB0bGJfaW5kZXhlZCk7Cj4gLQo+IC0gdWFz
bV9pX3hvcmkocCwgcHRyLCBwdHIsIE1JUFNfRU5UUllISV9FSElOVik7Cj4gLSBVQVNNX2lfTVRD
MChwLCBwdHIsIEMwX0VOVFJZSEkpOwo+IC0gYnVpbGRfaHVnZV91cGRhdGVfZW50cmllcyhwLCBw
dGUsIHB0cik7Cj4gLSBidWlsZF9odWdlX3RsYl93cml0ZV9lbnRyeShwLCBsLCByLCBwdGUsIHRs
Yl9yYW5kb20sIDApOwo+IC0KPiAtIHJldHVybjsKPiAtIH0KPiAtCj4gYnVpbGRfaHVnZV91cGRh
dGVfZW50cmllcyhwLCBwdGUsIHB0cik7Cj4gYnVpbGRfaHVnZV90bGJfd3JpdGVfZW50cnkocCwg
bCwgciwgcHRlLCB0bGJfaW5kZXhlZCwgMCk7Cj4gfQo+IEBAIC0yMjc4LDcgKzIyNjEsNyBAQCBz
dGF0aWMgdm9pZCBidWlsZF9yNDAwMF90bGJfbG9hZF9oYW5kbGVyKHZvaWQpCj4gdWFzbV9sX3Rs
YmxfZ29hcm91bmQyKCZsLCBwKTsKPiB9Cj4gdWFzbV9pX29yaSgmcCwgd3IucjEsIHdyLnIxLCAo
X1BBR0VfQUNDRVNTRUQgfCBfUEFHRV9WQUxJRCkpOwo+IC0gYnVpbGRfaHVnZV9oYW5kbGVyX3Rh
aWwoJnAsICZyLCAmbCwgd3IucjEsIHdyLnIyLCAxKTsKPiArIGJ1aWxkX2h1Z2VfaGFuZGxlcl90
YWlsKCZwLCAmciwgJmwsIHdyLnIxLCB3ci5yMik7Cj4gI2VuZGlmCj4KPiB1YXNtX2xfbm9wYWdl
X3RsYmwoJmwsIHApOwo+IEBAIC0yMzM0LDcgKzIzMTcsNyBAQCBzdGF0aWMgdm9pZCBidWlsZF9y
NDAwMF90bGJfc3RvcmVfaGFuZGxlcih2b2lkKQo+IGJ1aWxkX3RsYl9wcm9iZV9lbnRyeSgmcCk7
Cj4gdWFzbV9pX29yaSgmcCwgd3IucjEsIHdyLnIxLAo+IF9QQUdFX0FDQ0VTU0VEIHwgX1BBR0Vf
TU9ESUZJRUQgfCBfUEFHRV9WQUxJRCB8IF9QQUdFX0RJUlRZKTsKPiAtIGJ1aWxkX2h1Z2VfaGFu
ZGxlcl90YWlsKCZwLCAmciwgJmwsIHdyLnIxLCB3ci5yMiwgMSk7Cj4gKyBidWlsZF9odWdlX2hh
bmRsZXJfdGFpbCgmcCwgJnIsICZsLCB3ci5yMSwgd3IucjIpOwo+ICNlbmRpZgo+Cj4gdWFzbV9s
X25vcGFnZV90bGJzKCZsLCBwKTsKPiBAQCAtMjM5MSw3ICsyMzc0LDcgQEAgc3RhdGljIHZvaWQg
YnVpbGRfcjQwMDBfdGxiX21vZGlmeV9oYW5kbGVyKHZvaWQpCj4gYnVpbGRfdGxiX3Byb2JlX2Vu
dHJ5KCZwKTsKPiB1YXNtX2lfb3JpKCZwLCB3ci5yMSwgd3IucjEsCj4gX1BBR0VfQUNDRVNTRUQg
fCBfUEFHRV9NT0RJRklFRCB8IF9QQUdFX1ZBTElEIHwgX1BBR0VfRElSVFkpOwo+IC0gYnVpbGRf
aHVnZV9oYW5kbGVyX3RhaWwoJnAsICZyLCAmbCwgd3IucjEsIHdyLnIyLCAwKTsKPiArIGJ1aWxk
X2h1Z2VfaGFuZGxlcl90YWlsKCZwLCAmciwgJmwsIHdyLnIxLCB3ci5yMik7Cj4gI2VuZGlmCj4K
PiB1YXNtX2xfbm9wYWdlX3RsYm0oJmwsIHApOwo+IC0tCj4gMi4xNy4xCj4K

